#!/usr/bin/env python3
"""
SDK spec-freshness guard.

Fails CI when this SDK's view of the Repull API disagrees with the live spec at
https://api.repull.dev/openapi.json.

WHY THIS EXISTS
---------------
Every Repull SDK is generated from a committed snapshot of the OpenAPI spec
(openapi/v1.json). Nothing used to compare that snapshot to the live API, so
drift was invisible:

  * repull-sdk and repull-dotnet carried a 89-path snapshot that still declared
    ten /api/studio/* paths -- a different product on a different host -- inside
    the public API types, plus four endpoints that only ever returned 501/404.
  * Four SDKs still shipped /v1/sandbox/seed and /v1/sandbox/reset months after
    the sandbox was deleted from the API.
  * Every SDK was missing between 24 and 49 real endpoints, so those operations
    were unreachable from any SDK.

None of that failed a single check.

TWO MODES
---------
snapshot  (generated SDKs: python, php, go, ruby, dotnet, ts, mcp)
    Compares the PATH SET of the committed snapshot against the live spec and
    fails in BOTH directions:
      - a path in the snapshot that the API does not have  (the /api/studio/*
        and /v1/sandbox/* class of bug -- SDK ships dead code)
      - a path the API has that the snapshot is missing    (the reason dozens of
        operations were unreachable -- SDK is behind)

source    (hand-written SDKs with no snapshot: repull-ai-sdk)
    Scans source files for hardcoded "/v1/..." request paths and fails if any of
    them is absent from the live spec. One direction only: a hand-written SDK is
    not obliged to cover every endpoint, but it must never ship a call to an
    endpoint that does not exist. This is exactly the bug that let repull-ai-sdk
    ship six tools against /v1/market/context, /v1/analytics/revenue,
    /v1/analytics/occupancy, /v1/cleaning/rota, /v1/agent/quota and
    /v1/agent/usage -- all six 404.

The scheduled (cron) run matters as much as the pull_request run: the API can
grow new endpoints without anyone touching the SDK repo, and a PR-only check
would never notice.

USAGE
    python3 scripts/check-spec-freshness.py                       # snapshot mode, openapi/v1.json
    python3 scripts/check-spec-freshness.py --snapshot path.json
    python3 scripts/check-spec-freshness.py --mode source --source-dir src

ENV
    REPULL_OPENAPI_URL   override the live spec URL (default https://api.repull.dev/openapi.json)

EXIT CODES
    0  in sync
    1  drift detected
    2  could not fetch the live spec (network/HTTP) -- deliberately distinct
       from 1 so an outage is not mistaken for drift
"""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
import time
import urllib.error
import urllib.request

DEFAULT_SPEC_URL = "https://api.repull.dev/openapi.json"
FETCH_ATTEMPTS = 3
FETCH_BACKOFF_SECONDS = 2


# ---------------------------------------------------------------------------
# live spec
# ---------------------------------------------------------------------------

def _fetch_with_curl(url: str) -> str:
    """
    Fetch via curl.

    api.repull.dev sits behind Cloudflare, which fingerprints the TLS handshake
    (JA3/JA4) -- not just headers. Python's urllib/OpenSSL handshake gets a hard
    403 on EVERY request no matter what User-Agent or Accept headers are set,
    while curl on the same machine gets a 200. Setting a browser User-Agent does
    NOT help, because the block is below the HTTP layer.

    So curl is the primary transport. It is preinstalled on ubuntu-latest (and
    every other GitHub runner image), so this costs nothing in CI.
    """
    proc = subprocess.run(
        [
            "curl", "--silent", "--show-error", "--fail",
            "--location", "--max-time", "30",
            "--header", "Accept: application/json",
            url,
        ],
        capture_output=True,
        text=True,
    )
    if proc.returncode != 0:
        raise RuntimeError(f"curl exit {proc.returncode}: {proc.stderr.strip()}")
    return proc.stdout


def _fetch_with_urllib(url: str) -> str:
    req = urllib.request.Request(url, headers={"Accept": "application/json"})
    with urllib.request.urlopen(req, timeout=30) as resp:
        if resp.status != 200:
            raise RuntimeError(f"HTTP {resp.status}")
        return resp.read().decode("utf-8")


def fetch_live_spec(url: str) -> dict:
    last_err: Exception | None = None
    for attempt in range(1, FETCH_ATTEMPTS + 1):
        for transport in (_fetch_with_curl, _fetch_with_urllib):
            try:
                return json.loads(transport(url))
            except FileNotFoundError as err:  # curl missing -> try urllib
                last_err = err
            except Exception as err:  # noqa: BLE001 - retry anything transient
                last_err = err
        if attempt < FETCH_ATTEMPTS:
            print(
                f"  fetch attempt {attempt}/{FETCH_ATTEMPTS} failed ({last_err}); retrying...",
                file=sys.stderr,
            )
            time.sleep(FETCH_BACKOFF_SECONDS * attempt)

    print(f"\nERROR: could not fetch the live spec at {url}: {last_err}", file=sys.stderr)
    print("This is a fetch failure, not drift. Re-run the job.", file=sys.stderr)
    sys.exit(2)


HTTP_METHODS = ("get", "post", "put", "patch", "delete", "head", "options")


def spec_bare_paths(spec: dict, label: str) -> set[str]:
    """Just the path keys, for source mode -- a literal in code has no method."""
    paths = spec.get("paths")
    if not isinstance(paths, dict):
        print(f"ERROR: {label} has no usable 'paths' object", file=sys.stderr)
        sys.exit(2)
    return set(paths)


def spec_paths(spec: dict, label: str) -> set[str]:
    """Every OPERATION, as "POST /v1/reservations" -- not just the path key.

    Comparing bare path keys let a whole operation disappear unnoticed. Four
    write endpoints (create a reservation, update a reservation, create a
    guest, send a message to a guest) were added as new METHODS on paths that
    already existed for GET, so the path set was byte-identical before and
    after and every SDK silently lacked them while this check printed OK.

    Method + path is the unit a caller actually reaches for, so it is the unit
    the guard compares.
    """
    paths = spec.get("paths")
    if not isinstance(paths, dict):
        print(f"ERROR: {label} has no usable 'paths' object", file=sys.stderr)
        sys.exit(2)
    ops: set[str] = set()
    for path, item in paths.items():
        if not isinstance(item, dict):
            continue
        for method in item:
            if method.lower() in HTTP_METHODS:
                ops.add(f"{method.upper()} {path}")
    return ops


# ---------------------------------------------------------------------------
# snapshot mode
# ---------------------------------------------------------------------------

def run_snapshot_mode(snapshot_path: str, live: set[str]) -> int:
    if not os.path.isfile(snapshot_path):
        print(f"ERROR: snapshot not found at {snapshot_path}", file=sys.stderr)
        return 2

    with open(snapshot_path, encoding="utf-8") as handle:
        local = spec_paths(json.load(handle), snapshot_path)

    stale = sorted(local - live)   # SDK declares it, API does not have it
    missing = sorted(live - local)  # API has it, SDK cannot reach it

    print(f"  snapshot : {snapshot_path} ({len(local)} operations)")
    print(f"  live     : {len(live)} operations")

    if not stale and not missing:
        print(f"\nOK: snapshot matches the live API exactly ({len(local)} operations).")
        return 0

    print("\nFAIL: committed OpenAPI snapshot has drifted from the live API.\n")

    if stale:
        print(f"  {len(stale)} operation(s) in the SDK that the API DOES NOT HAVE")
        print("  (the SDK ships dead code -- these calls will 404):")
        for path in stale:
            print(f"    - {path}")
        print()

    if missing:
        print(f"  {len(missing)} operation(s) the API HAS that the SDK IS MISSING")
        print("  (these operations are unreachable from this SDK):")
        for path in missing:
            print(f"    + {path}")
        print()

    print("  FIX: re-run this repo's regen script to pull the live spec and")
    print("       regenerate the client, then commit the snapshot and the")
    print("       generated code together. Never hand-edit generated types.")
    return 1


# ---------------------------------------------------------------------------
# source mode
# ---------------------------------------------------------------------------

SOURCE_SUFFIXES = (".ts", ".tsx", ".js", ".mjs", ".py", ".go", ".rb", ".php", ".cs")
SKIP_DIRS = {
    "node_modules", "dist", "build", "vendor", ".git", ".claude",
    "__pycache__", "coverage", ".next", "bin", "obj",
}

# Matches a quoted/templated request path literal beginning with /v1/.
PATH_LITERAL = re.compile(r"""['"`](/v1/[A-Za-z0-9_\-./{}$@:]*)['"`]""")
# ${id} / {id} / :id / #{id} -> a single wildcard segment
INTERPOLATION = re.compile(r"\$\{[^}]*\}|#\{[^}]*\}|\{[^}]*\}|(?<=/):[A-Za-z_][A-Za-z0-9_]*")


def normalize(path: str) -> tuple[str, ...]:
    """Turn a path into comparable segments, with parameters as a wildcard."""
    path = path.split("?", 1)[0].rstrip("/")
    segments: list[str] = []
    for segment in path.split("/"):
        if not segment:
            continue
        collapsed = INTERPOLATION.sub("\x00", segment)
        segments.append("*" if "\x00" in collapsed else segment)
    return tuple(segments)


def live_shapes(live: set[str]) -> set[tuple[str, ...]]:
    return {normalize(p) for p in live}


def iter_source_files(root: str):
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = [d for d in dirnames if d not in SKIP_DIRS and not d.startswith(".")]
        for name in filenames:
            if name.endswith(SOURCE_SUFFIXES) and ".test." not in name and ".spec." not in name:
                yield os.path.join(dirpath, name)


def run_source_mode(source_dir: str, live: set[str]) -> int:
    if not os.path.isdir(source_dir):
        print(f"ERROR: source dir not found at {source_dir}", file=sys.stderr)
        return 2

    shapes = live_shapes(live)
    found: dict[str, set[str]] = {}

    for file_path in iter_source_files(source_dir):
        try:
            text = open(file_path, encoding="utf-8", errors="replace").read()
        except OSError:
            continue
        for raw in PATH_LITERAL.findall(text):
            found.setdefault(raw, set()).add(file_path)

    print(f"  source dir : {source_dir}")
    print(f"  live       : {len(live)} paths")
    print(f"  found      : {len(found)} distinct /v1/ path literal(s) in source")

    bogus = sorted(p for p in found if normalize(p) not in shapes)

    if not bogus:
        print(f"\nOK: every /v1/ path referenced in source exists in the live API.")
        return 0

    print(f"\nFAIL: {len(bogus)} path(s) referenced in source do NOT exist in the live API.")
    print("These calls will 404 at runtime.\n")
    for path in bogus:
        print(f"    - {path}")
        for where in sorted(found[path]):
            print(f"        {where}")
    print()
    print("  FIX: delete the tool/method, or repoint it at a real endpoint.")
    print(f"       Full endpoint list: {os.environ.get('REPULL_OPENAPI_URL', DEFAULT_SPEC_URL)}")
    return 1


# ---------------------------------------------------------------------------

def main() -> int:
    parser = argparse.ArgumentParser(description="Fail when an SDK drifts from the live Repull OpenAPI spec.")
    parser.add_argument("--mode", choices=("snapshot", "source"), default="snapshot")
    parser.add_argument("--snapshot", default="openapi/v1.json", help="committed spec snapshot (snapshot mode)")
    parser.add_argument("--source-dir", default="src", help="source root to scan (source mode)")
    parser.add_argument("--spec-url", default=os.environ.get("REPULL_OPENAPI_URL", DEFAULT_SPEC_URL))
    args = parser.parse_args()

    print("Repull SDK spec-freshness check")
    print(f"  spec url : {args.spec_url}")

    spec = fetch_live_spec(args.spec_url)

    if args.mode == "snapshot":
        # Method + path, so an operation added to an existing path is visible.
        return run_snapshot_mode(args.snapshot, spec_paths(spec, args.spec_url))

    # Source mode matches bare "/v1/..." literals found in code, which carry no
    # method, so it compares against paths rather than operations.
    return run_source_mode(args.source_dir, spec_bare_paths(spec, args.spec_url))



if __name__ == "__main__":
    sys.exit(main())
