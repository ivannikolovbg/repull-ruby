#!/usr/bin/env python3
"""
Helpers for the hourly spec-refresh workflow (.github/workflows/spec-refresh.yml).

The SDK is generated from a committed snapshot of https://api.repull.dev/openapi.json
(openapi/v1.json). The API changes almost daily from other repos while this repo
sits untouched, so a manual regen always loses and the Spec freshness check goes
red. The spec-refresh workflow calls this script to:

  fetch OUT
      Download the live spec to OUT with curl and refuse anything that is not a
      plausible OpenAPI document (error page, empty body, truncated download).
      curl, not urllib: api.repull.dev sits behind Cloudflare, which blocks
      non-curl TLS fingerprints (see check-spec-freshness.py).

  changed LIVE SNAPSHOT [--ignore-enums]
      Print "true" when the live spec differs from the committed snapshot in
      anything a generator turns into code, else "false". Prose (description,
      summary, example, examples) is ignored: the API rewrites copy constantly,
      and regenerating 800 files for a reworded sentence would churn the repo
      and the release history. --ignore-enums is for repull-ruby, whose regen
      strips string enums from the snapshot before generating.

  changelog OLD NEW VERSION [--changelog CHANGELOG.md]
      Insert a "## VERSION - date" entry above the newest entry in the
      changelog, listing the operations added and removed between the OLD and
      NEW snapshots.

Stdlib only, so it runs on any runner without a setup step.
"""

from __future__ import annotations

import argparse
import datetime as dt
import json
import os
import subprocess
import sys
import time

DEFAULT_SPEC_URL = "https://api.repull.dev/openapi.json"
PROSE_KEYS = {"description", "summary", "example", "examples"}
HTTP_METHODS = ("get", "post", "put", "patch", "delete", "head", "options")


def cmd_fetch(args: argparse.Namespace) -> int:
    url = os.environ.get("REPULL_OPENAPI_URL", DEFAULT_SPEC_URL)
    last = ""
    for attempt in range(1, 4):
        proc = subprocess.run(
            ["curl", "--silent", "--show-error", "--fail", "--location",
             "--max-time", "60", "--header", "Accept: application/json",
             url, "-o", args.out],
            capture_output=True, text=True,
        )
        if proc.returncode == 0:
            break
        last = proc.stderr.strip()
        print(f"fetch attempt {attempt}/3 failed: {last}", file=sys.stderr)
        time.sleep(3 * attempt)
    else:
        print(f"ERROR: could not fetch {url}: {last}", file=sys.stderr)
        return 2

    try:
        with open(args.out, encoding="utf-8") as fh:
            spec = json.load(fh)
    except ValueError as err:
        print(f"ERROR: {url} did not return JSON: {err}", file=sys.stderr)
        return 2
    paths = spec.get("paths") if isinstance(spec, dict) else None
    if not spec.get("openapi") or not isinstance(paths, dict) or len(paths) < 50:
        print(f"ERROR: {url} is not a plausible OpenAPI spec", file=sys.stderr)
        return 2
    print(f"fetched {url}: {len(paths)} paths, {len(operations(spec))} operations")
    return 0


def canonical(node, ignore_enums: bool, keys_are_names: bool = False):
    """Drop prose keywords, keeping keys that are NAMES (a schema property
    called "description", a path, a schema name) -- those are API shape."""
    if isinstance(node, dict):
        out = {}
        for k, v in node.items():
            if not keys_are_names:
                if k in PROSE_KEYS:
                    continue
                if ignore_enums and k == "enum":
                    continue
            # Children of these keywords are keyed by name, not by keyword.
            names_below = not keys_are_names and k in (
                "properties", "paths", "schemas", "responses", "parameters",
                "requestBodies", "headers", "securitySchemes", "callbacks",
                "links", "content", "patternProperties", "definitions",
                "$defs", "webhooks", "encoding", "variables", "mapping",
            )
            out[k] = canonical(v, ignore_enums, names_below)
        return out
    if isinstance(node, list):
        return [canonical(v, ignore_enums) for v in node]
    return node


def load(path: str) -> dict:
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)


def cmd_changed(args: argparse.Namespace) -> int:
    live = canonical(load(args.live), args.ignore_enums)
    snap = canonical(load(args.snapshot), args.ignore_enums)
    live.pop("info", None)
    snap.pop("info", None)
    print("true" if live != snap else "false")
    return 0


def operations(spec: dict) -> set[str]:
    ops = set()
    for path, item in (spec.get("paths") or {}).items():
        if isinstance(item, dict):
            for method in item:
                if method.lower() in HTTP_METHODS:
                    ops.add(f"{method.upper()} {path}")
    return ops


def cmd_changelog(args: argparse.Namespace) -> int:
    old, new = operations(load(args.old)), operations(load(args.new))
    added, removed = sorted(new - old), sorted(old - new)
    today = dt.datetime.now(dt.timezone.utc).date().isoformat()
    lines = [f"## {args.version} — {today}", ""]
    lines += [f"- New: `{op}`" for op in added]
    lines += [f"- Removed (no longer in the API): `{op}`" for op in removed]
    lines += ["- Regenerated from the live spec (automated spec refresh).", ""]
    entry = "\n".join(lines) + "\n"

    try:
        with open(args.changelog, encoding="utf-8") as fh:
            text = fh.read()
    except FileNotFoundError:
        text = "# Changelog\n\n"
    idx = text.find("\n## ")
    if idx == -1:
        text = text.rstrip("\n") + "\n\n" + entry
    else:
        text = text[: idx + 1] + entry + text[idx + 1:]
    with open(args.changelog, "w", encoding="utf-8") as fh:
        fh.write(text)
    print(entry)
    return 0


def main() -> int:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("fetch")
    p.add_argument("out")
    p = sub.add_parser("changed")
    p.add_argument("live")
    p.add_argument("snapshot")
    p.add_argument("--ignore-enums", action="store_true")
    p = sub.add_parser("changelog")
    p.add_argument("old")
    p.add_argument("new")
    p.add_argument("version")
    p.add_argument("--changelog", default="CHANGELOG.md")
    args = parser.parse_args()
    return {"fetch": cmd_fetch, "changed": cmd_changed, "changelog": cmd_changelog}[args.cmd](args)


if __name__ == "__main__":
    sys.exit(main())
