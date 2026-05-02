# Changelog

All notable changes to the `repull` gem are documented here.

## [0.1.2] - 2026-05-02

### Added
- **Custom Schemas API** (`Repull::SchemaApi`) — five new operations to create, list, retrieve, update, and delete workspace-scoped field-mapping schemas:
  - `create_custom_schema`
  - `list_custom_schemas`
  - `get_custom_schema(id)`
  - `update_custom_schema(id, ...)`
  - `delete_custom_schema(id)`
- New models: `CustomSchema`, `CustomSchemaCreate`, `CustomSchemaUpdate`, `CustomSchemaSummary`, `CustomSchemaListResponse`, `CustomSchemaCreateResponse`, `CustomSchemaDeleteResponse`. (The `mappings` field is represented as `Hash<String, String>` directly.)
- Custom schemas reshape `native` read responses to a workspace's preferred field names. Apply one per request via the `X-Schema: <name>` header on any read endpoint. Sending a header value of `native` (or omitting it) returns the canonical shape.

### Changed (breaking)
- **Reservation shape drift fixed.** The `Reservation` model has been regenerated against the current OpenAPI spec. Consumers parsing reservations defensively (e.g. checking field presence) will be unaffected; consumers depending on the previous field set should diff `docs/Reservation.md` against v0.1.1.
- Regenerated affected APIs: `ConversationsApi`, `GuestsApi`, `ListingsApi`, `ReservationsApi`, `ReviewsApi`.

### Notes
- Generated from `https://api.repull.dev/api/repull/openapi.json` via `openapi-generator-cli` 7.22.0.
- See `scripts/regen.sh` for the regen flow.

## [0.1.1] - earlier

- Adds `Conversations`, `Guests`, `Reviews` APIs.
- Cursor-paginated reservations.

## [0.1.0] - initial

- Initial Ruby SDK generated from OpenAPI.
