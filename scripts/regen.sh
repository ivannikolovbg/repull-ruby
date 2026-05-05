#!/usr/bin/env bash
# Regenerate the Ruby SDK from the live OpenAPI spec.
#
# 1. Snapshots https://api.repull.dev/openapi.json -> openapi/v1.json
# 2. Normalizes the snapshot — strips overly narrow string enums that the live
#    API is known to violate (e.g. Reservation.platform = "test-flows",
#    Reservation.status = "accept"). The Ruby generator emits unconditional
#    enum-validating setters, so any out-of-list value crashes deserialization.
#    We accept all string values and let consumers compare against constants
#    of their own choosing.
# 3. Regenerates lib/repull/ via openapi-generator-cli (Ruby template).
#
# Requires: bash, curl, python3, npx (Node.js), Java (openapi-generator runtime).

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SPEC_URL="${REPULL_SPEC_URL:-https://api.repull.dev/openapi.json}"
SPEC_PATH="$ROOT/openapi/v1.json"
GEN_OUT="$(mktemp -d)"

trap 'rm -rf "$GEN_OUT"' EXIT

echo "==> snapshotting spec from $SPEC_URL"
curl --fail --silent --show-error -o "$SPEC_PATH" "$SPEC_URL"

echo "==> normalizing spec (drop narrow string enums)"
python3 - "$SPEC_PATH" <<'PY'
import json, sys
path = sys.argv[1]
spec = json.load(open(path))
removed = 0
for name, schema in spec.get('components', {}).get('schemas', {}).items():
    for prop_name, prop in (schema.get('properties') or {}).items():
        if isinstance(prop, dict) and 'enum' in prop and prop.get('type') == 'string':
            prop.pop('enum')
            removed += 1
json.dump(spec, open(path, 'w'), indent=2)
print(f'dropped {removed} string enums')
PY

echo "==> generating ruby client into $GEN_OUT"
npx --yes @openapitools/openapi-generator-cli@latest generate \
  -i "$SPEC_PATH" \
  -g ruby \
  -o "$GEN_OUT" \
  --additional-properties=gemName=repull,moduleName=Repull,gemVersion=0.2.1

echo "==> syncing lib/ + docs/"
rm -rf "$ROOT/lib/repull" "$ROOT/lib/repull.rb" "$ROOT/docs"
cp -R "$GEN_OUT/lib/repull" "$ROOT/lib/repull"
cp    "$GEN_OUT/lib/repull.rb" "$ROOT/lib/repull.rb"
cp -R "$GEN_OUT/docs" "$ROOT/docs"

echo "==> done. review with: git diff -- lib/ docs/ openapi/"
