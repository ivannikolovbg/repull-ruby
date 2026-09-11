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

echo "==> normalizing spec (drop narrow string enums, patch missing path params)"
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
print(f'dropped {removed} string enums')

# The live spec's POST /v1/reviews/{id}/reply omits the `id` path-parameter
# declaration (present in the path template, missing from `parameters`),
# which fails openapi-generator's spec validation. Patch it in-place, mirroring
# the declaration style used by sibling {id}-scoped write routes (e.g.
# /v1/channels/airbnb/alterations/{id}/accept). Remove this patch once the
# live spec declares the parameter itself.
patched = 0
for path_tpl, item in spec.get('paths', {}).items():
    if '{id}' not in path_tpl:
        continue
    for method, op in item.items():
        if method not in ('get', 'post', 'put', 'patch', 'delete') or not isinstance(op, dict):
            continue
        params = op.get('parameters', [])
        if any(isinstance(p, dict) and p.get('in') == 'path' and p.get('name') == 'id' for p in params):
            continue
        params.append({
            'name': 'id',
            'in': 'path',
            'required': True,
            'schema': {'type': 'string'},
            'description': 'Resource id from the path.',
        })
        op['parameters'] = params
        patched += 1
        print(f'patched missing path param: {method.upper()} {path_tpl}')
print(f'patched {patched} missing path-parameter declarations')

json.dump(spec, open(path, 'w'), indent=2)
PY

echo "==> generating ruby client into $GEN_OUT"
npx --yes @openapitools/openapi-generator-cli@latest generate \
  -i "$SPEC_PATH" \
  -g ruby \
  -o "$GEN_OUT" \
  --additional-properties=gemName=repull,moduleName=Repull,gemVersion=0.2.12

echo "==> syncing lib/ + docs/"
rm -rf "$ROOT/lib/repull" "$ROOT/lib/repull.rb" "$ROOT/docs"
cp -R "$GEN_OUT/lib/repull" "$ROOT/lib/repull"
cp    "$GEN_OUT/lib/repull.rb" "$ROOT/lib/repull.rb"
cp -R "$GEN_OUT/docs" "$ROOT/docs"

echo "==> done. review with: git diff -- lib/ docs/ openapi/"
