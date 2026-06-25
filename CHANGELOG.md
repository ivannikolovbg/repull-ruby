# Changelog

All notable changes to the `repull` gem are documented here.

## [0.2.6] - 2026-06-25

### Added

- **`Property#channels` accessor.** `Array<String>` of the OTAs/channels a property is actively published on (e.g. `airbnb`, `booking`, `vrbo`). Empty array when the property has no active channel links.
- **`channel` filter on `GET /v1/properties`.** Pass `channel:` to `PropertiesApi#properties_get` to return only properties published on that channel.

## [0.2.5] - 2026-06-24

### Added

- Add `messaging` Airbnb Connect access scope (read + send guest messages, no property management).

## [0.2.4] - 2026-05-15

### Added

- **`listings_limit_exceeded` (402) error type** for plan-listings cap enforcement. The API now returns `402 Payment Required` with `error.code = "listings_limit_exceeded"` when a customer is over their tier's active-listing cap (free=5, starter=50, custom=unlimited). Unlike 429, this is NOT a "wait and retry" condition — `Retry-After` is not set. Recovery paths: `DELETE` listings to fall under the cap, or upgrade at `repull.dev/dashboard/billing`. `/v1/health`, `/v1/usage/*`, and any `DELETE` are exempt. The 402 envelope mirrors `rate_limit_exceeded` and adds `tier`, `limit`, `active_listings`, `upgrade_url`. Tracks vanio-repull-api PR #66.

## [0.2.3] - 2026-05-09

### Added

- **`Listing#content` and `Listing#details` accessors.** Optional, populated only when the caller passes `?include=content` or `?include=details` on listing read endpoints. Sourced from `listings_descriptions` (en locale) and `listings_details` respectively. Field absent = caller did not opt in; field `null` = no row stored.
- **`Repull::ListingDetails` model.** New schema for the structured details payload returned by `?include=details`.

## [0.2.0] - 2026-05-02

### Changed (breaking)

This release locks the Repull SDK against the canonical, AI-agent-friendly response envelope shipped on `api.repull.dev`. All breaking changes are deliberate and consumers should expect to update wire-format readers.

- **Pagination canonical envelope.** All list endpoints now return `{ data: [...], pagination: { next_cursor, has_more, total? } }`. The `pagination` block guarantees `next_cursor` and `has_more` (both required); `total` is opt-in via a request flag. Replace any code that read top-level arrays or legacy keys (`markets`, `total_in_filter`, `data` aliases, etc.).
- **camelCase field names everywhere.** Every property on every model is camelCase across all responses, requests, and webhook payloads. Snake_case Ruby accessors map to camelCase JSON via the generator's existing attribute-map layer — no consumer code change is required for accessor names, but raw-hash consumers (e.g. anyone reading `body['next_cursor']`) must switch to camelCase keys (`body['nextCursor']`).
- **All IDs are string-typed.** `Reservation.id`, `Property.id`, `Guest.id`, `Connection.id`, `Webhook.id`, etc. are now `String` (not numeric). Stop coercing to `Integer`. Schema-side this is reflected at `components.schemas.Reservation.id.type = "string"`.
- **`POST /v1/connect/airbnb` response field renamed.** `oauth_url` (snake) / `oauthUrl` (camel) is now simply `url`. Consumers that read `response.oauth_url` must switch to `response.url`.
- **`GET /v1/markets` envelope normalized.** `markets` → `data`; `total_in_filter` → `pagination.total`. The endpoint now matches the canonical envelope used by every other list endpoint.
- **`GET /v1/reviews/{id}` returns the bare `Review` object.** No more `{ review: {...} }` wrapper. Read fields directly off the response (`response.id`, `response.rating`, etc.).
- **`/v1/channels/airbnb/*` endpoints now return canonical envelope.** All Airbnb channel list endpoints (reservations, listings, conversations, etc.) now return `{ data, pagination }` like the rest of the API. Single-resource GETs return the bare object.

### Added

- **Self-documenting error envelope.** Every 4xx/5xx response now ships with structured fields designed for LLM self-recovery: `error.code` (stable identifier), `error.message`, `error.fix` (exact recovery steps), `error.docs_url`, `error.request_id`, plus parameter-specific fields when applicable (`error.field`, `error.value_received`, `error.valid_values`, `error.did_you_mean`, `error.retry_after`). Reflected in the `Error` and `ErrorError` model surface.
- **Rate-limit headers exposed on every response.** `X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset`, `X-RateLimit-Policy`, plus `Retry-After` on 429s. Default policy: 600 requests / 60 seconds, sliding window, per API key. Consumers should honor `Retry-After` and back off with jitter.
- **`X-Request-ID` correlation.** Every response carries `X-Request-ID` (also embedded as `error.request_id` on failures). Set the header on the inbound request to forward your own trace id; we'll echo it back. Format: `^[\w.-]{1,128}$`.
- **`X-Schema` reshape header.** Send `X-Schema: <name>` on any read endpoint to apply a workspace-scoped field-mapping schema to the response. Sending `native` (or omitting the header) returns the canonical shape.
- **Schema CRUD API** (carried forward from 0.1.2): `Repull::SchemaApi` — `create_custom_schema`, `list_custom_schemas`, `get_custom_schema(id)`, `update_custom_schema(id, ...)`, `delete_custom_schema(id)`.
- **New detail endpoints** for individual resources across reservations, listings, guests, conversations, reviews, and webhook deliveries.
- **API key prefix.** `sk_test_` for sandbox, `sk_live_` for production.
- **`pagination.total` opt-in.** Pass the appropriate request flag to receive a `total` count in the pagination envelope (off by default to keep list endpoints fast).
- **Strict params.** Typo'd or unknown query parameters now return a 400 with `error.code = "invalid_params"` and `error.did_you_mean` suggestions, instead of being silently ignored.

### Notes

- Generated from `https://api.repull.dev/openapi.json` via `openapi-generator-cli` 7.22.0.
- See `scripts/regen.sh` for the regen flow.
- Stale generator-artifact spec files (e.g. `v1_webhooks_test_post_request_spec.rb` referencing `Repull::V1WebhooksTestPostRequest`) have been removed; the actual model is `Repull::TestWebhookRequest`. The full spec suite (168 examples) is green.

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
