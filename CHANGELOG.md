# Changelog

All notable changes to the `repull` gem are documented here.

## [0.2.18] - 2026-09-24

Regenerated against the live `https://api.repull.dev/openapi.json` (202 → 209 operations).

### Added
- **Repull Migrate** — `Repull::MigrateApi`: `list_migrations`, `get_migration`, `get_migration_report`,
  `get_migration_channel_map`, `run_migration_import`, `check_migration_cutover`, `cutover_migration`,
  `delete_migration`.
- `create_connect_session` accepts `purpose: 'migrate'`, `workspace`, `copy` and `scope`; the session returns `workspace_id`.
- `migration.completed` / `migration.failed` webhook events; child-workspace events carry `workspace_id`.
- `ConnectProvider#migration_capabilities`.

### Changed
- Airbnb permits write takes Airbnb's submission shape (`flow_slug` + `answers` keyed by `answer_key`).

### Removed
- `get_atlas_health` (endpoint retired).

## [0.2.17] - 2026-09-23

### Added

- **Regenerated against the live spec (199 → 202 operations, none removed).**
- **Market state** — `ListingsApi#take_listing_online` / `#take_listing_offline` (`POST /v1/listings/{id}/online|offline`). Takes a listing off sale, or puts it back, on every connected channel in one call. Not the same as deactivating in Repull: going offline stops the listing taking bookings but leaves billing, plan limits and API access untouched; `active: false` does the opposite. The answer is per channel item — read each `ChannelMarketStateItem#ok`, because channels fail independently and a partial result is the ordinary outcome. Models: `ListingMarketStateRequest`, `ListingMarketStateResponse`, `ChannelMarketStateItem`.
- **Booking.com unlist / relist** — `BookingComApi#booking_property_action` (`POST /v1/channels/booking/properties/{id}`; `id` is a Repull listing id, not a hotel id). Booking.com has no unlist, so `unlist` closes the mapped room across the forward window; `relist` re-syncs the true calendar rather than opening everything, so genuinely blocked dates stay blocked. Pass `hotel_id` when the listing maps to several properties, or the call is refused with `409 ambiguous_booking_mapping` and nothing is written. Models: `BookingPropertyActionRequest`, `BookingPropertyActionResponse`.
- **Booking.com setup actions** — `POST /v1/channels/booking/setup` gains `create-property`, `add-room`, `add-unit`, `advance`.
- **Listing address + room type on create** — `ListingCreateRequest` gains `room_type_category`, `property_type_category`, `postal_code` (plus the `zipcode` alias); `ListingContentUpdateRequestAddress` gains `state` and `postal_code`. Airbnb refuses to activate a listing that has not stated a room type.
- **Publish diagnostics** — `ListingPublishStatusChannel#push_error` (the channel's own reason for the last failed push, verbatim), `ListingPublishStatusConnection#locked_fields`, `ListingPublishStatusResponse#address_readiness` (`ListingAddressReadiness`).
- **Publish results** — new `BookingPublishResult` / `BookingPublishSectionError`; `AirbnbPublishResult` gains `live` and `warnings`. `published: true` with `live: false` is a real and common outcome — content landed but activation never ran; `warnings` says why. `nil` is not `false`.
- **Errors** — the error envelope gains `previous_code`.

### Changed

- `ListingPublishResponse` is now `ListingPublishBookingResponse` (the model behind `POST /v1/listings/{id}/publish/booking`); the old name is gone.

## [0.2.16] - 2026-09-22

### Added

- **Regenerated against the live spec (191 → 199 operations, none removed).**
- **Inquiries** — `ConversationsApi#list_inquiries` (`GET /v1/inquiries`; `status` defaults to `open`, `all` for every state).
- **Pre-approval** — `ConversationsApi#preapprove_conversation` (`POST /v1/conversations/{id}/pre-approval`, optional `block_instant_booking`).
- **Special offers** — `ConversationsApi#create_conversation_special_offer` / `#get_conversation_special_offer` / `#withdraw_conversation_special_offer` (`POST`/`GET`/`DELETE /v1/conversations/{id}/special-offers[/{offerId}]`), plus `AirbnbApi#get_airbnb_offer` (`GET /v1/channels/airbnb/offers?offerId=`).
- **Booking requests** — `ReservationsApi#accept_reservation_request` / `#decline_reservation_request` (`POST /v1/reservations/{id}/accept|decline`).
- **Message attachments** — `SendMessageRequest#attachments` (1–5 `SendMessageAttachment`s by public `https://` URL) on `ConversationsApi#send_conversation_message`; the response carries `SentAttachment`s.
- **Webhooks** — `WebhookEventType` gains `reservation.request.created`, `reservation.request.updated`, `inquiry.created`, `inquiry.updated`; models `ReservationRequestCreatedEvent`, `ReservationRequestUpdatedEvent`, `InquiryCreatedEvent`, `InquiryUpdatedEvent`, `InquiryWebhookObject`.
- `Reservation` gains `status_detail` (`request_expired`) and `respond_by`.

### Changed

- `AirbnbApi#airbnb_reservation_action(code, airbnb_reservation_action_request, opts = {})` — the spec now marks the request body as required, so it is a positional argument instead of `opts[:body]`.

## [0.2.15] - 2026-09-18

### Added

- **Regenerated against the live spec (175 → 191 operations).** New Airbnb listing content write surface, plus a manual pull-from-Airbnb operation.
- **Airbnb booking settings** — `AirbnbApi#get_airbnb_booking_settings` / `#update_airbnb_booking_settings` (`GET`/`PUT /v1/channels/airbnb/listings/{id}/booking-settings`). Covers cancellation policy (including non-refundable), instant book, advance notice, booking window, check-in/check-out windows, and preparation time.
- **Airbnb listing details** — `AirbnbApi#get_airbnb_listing_details` / `#update_airbnb_listing_details` (`GET`/`PUT .../details`). Property type, room type, quiet hours, check-in method, and the `lockedFields` Airbnb will not let this listing change.
- **Airbnb permits** — `AirbnbApi#list_airbnb_listing_permits` / `#update_airbnb_listing_permits` (`GET`/`PUT .../permits`).
- **Airbnb safety disclosures** — `AirbnbApi#list_airbnb_listing_safety_disclosures` / `#update_airbnb_listing_safety_disclosures` (`GET`/`PUT .../safety-disclosures`).
- **Airbnb per-locale descriptions** — `AirbnbApi#update_airbnb_listing_descriptions` (`PUT .../descriptions`), for non-primary-locale content (the existing publish flow only pushes the primary locale).
- **Airbnb photo management** — `AirbnbApi#update_airbnb_listing_photo` (`PATCH .../photos`), `#reorder_airbnb_listing_photos` (`PUT .../photos/order`), `#set_airbnb_listing_cover_photo` (`PUT .../photos/cover`).
- **Airbnb rooms + amenities** — `AirbnbApi#update_airbnb_listing_room` (`PUT .../rooms`), `#update_airbnb_listing_amenities` (`PUT .../amenities`).
- **Airbnb alteration cancel** — `AirbnbApi#cancel_airbnb_alteration` (`POST /v1/channels/airbnb/alterations/{id}/cancel`), alongside the existing accept/reject.
- **Manual Airbnb pull** — `ListingsApi#pull_listing_from_airbnb` (`POST /v1/listings/{id}/pull/airbnb`), typed `ListingPullResponse`.
- `?include=thumbnail` now works on **both** listing list endpoints — `ListingsApi#list_listings` and `AirbnbApi#list_airbnb_listings` — guaranteeing `thumbnailUrl` on every row, including reduced inactive ones.
- `AirbnbConnection` gains `syncCategory` (Airbnb's own per-listing API sync decision — `sync_all` / `sync_rates_and_availability` / `none`) and `writable` (`false` exactly when `syncCategory` is `none`), plus `lockedFields`, `accountId`, `accountName`, `hostName` (`hostId`/`hostName` kept as compatibility aliases for `accountId`/`accountName`).
- `AirbnbDataFreshness.accounts` (`AirbnbAccountFreshness`) — per-connected-account freshness verdict, so one disconnected host no longer marks the whole response stale (`stale` becomes `false` with `reason: partial_account_staleness` instead).
- `Reservation.checkInTime` / `Reservation.checkOutTime` — local `HH:MM` check-in/check-out time in the property's own timezone.
- New error code `listing_not_api_connected`, with `ErrorError.listingId` / `.airbnbListingId` / `.syncCategory` — returned when a write targets a listing Airbnb has not authorized for API sync.
- Typed `AirbnbPublishResult.lockedFields` on the publish response.

### BREAKING

- `AirbnbApi#create_airbnb_alteration` request model renamed: `CreateAirbnbAlterationRequest` → `AirbnbAlterationCreateRequest`. The old class is removed.
- `ListingsApi#publish_listing_to_airbnb` now returns the newly-typed `ListingPublishAirbnbResponse` instead of the generic `ListingPublishResponse`. (`ListingPublishResponse` itself is unchanged and still used by the non-Airbnb-specific publish endpoint.)

## [0.2.14] - 2026-09-15

### Added

- **Regenerated against the live spec (174 → 175 operations).**
- `ListingsApi#set_listings_status` — `POST /v1/listings/status`. Activate or deactivate up to 500 listings in one all-or-nothing call. New models `ListingStatusBatchRequest` (`listing_ids`, `active`) and `ListingStatusBatchResponse` (`active`, `updated`, `unchanged`).
- `ConnectApi#delete_connection(provider, account_id: ...)` — optional `accountId` query param on `DELETE /v1/connect/{provider}`, required when a workspace has more than one account for the provider. Typed `DeleteConnection200Response` (`disconnected`, `provider`, `account_id`, `listings_deactivated`); the account's listings are deactivated, not deleted.
- `ConnectStatus#accounts` (`ConnectStatusAccountsInner`) — every Airbnb account the workspace has connected.
- New `403 listing_inactive` error response, declared on 83 operations.
- Airbnb calendar operations gain `busy_subtype`; `AirbnbPricingWriteRequest` LOS `records` are now typed (`AirbnbPricingWriteRequestRecordsInner`).

### Changed

- Lists default to active listings: `GET /v1/listings` accepts `status=active|inactive|archived|all`, `GET /v1/properties` accepts `status=active|inactive|all`. Inactive rows carry identity fields only; reading or writing an inactive listing returns `403 listing_inactive`.
- Airbnb calendar writes (`PUT .../pricing`, `PUT .../availability`) validate more strictly (unknown fields such as `price` are refused with `422 invalid_params`) and declare new errors: `422 airbnb_rejected`, `403 connection_reauth_required`, `429 airbnb_rate_limited`.
- Sending `accessType` to `POST /v1/connect/airbnb` now locks the consent screen to that tier; omit it to let the host choose.

### Deprecated

- Booking.com webhooks endpoints (`GET`/`POST`/`DELETE /v1/channels/booking/webhooks`) are deprecated and always return `403`.

### Fixed

- Removed the stale generated `spec/api/ai_api_spec.rb`, which tested the long-removed `AIApi` and failed `rspec` on every run.

## [0.2.13] - 2026-09-11

### Fixed

- **Regenerated against 19 schema corrections merged into the live spec.** Path/operation inventory is unchanged (124 paths / 174 operations) — only shapes changed:
  - 10 fields renamed snake_case → camelCase on the wire (`data_freshness`→`dataFreshness`, `last_synced_at`→`lastSyncedAt`, `fix_url`→`fixUrl`, `next_cursor`→`nextCursor`, `has_more`→`hasMore`, `monthly_requests`→`monthlyRequests`, `daily_ai_requests`→`dailyAiRequests`, `daily_ai`→`dailyAi`, `dynamic_pricing_listings`→`dynamicPricingListings`, `resets_at`→`resetsAt`). The Ruby attribute names stay snake_case (Ruby convention); `attribute_map` now maps each to the correct camelCase JSON key.
  - 3 list responses changed from `{data, pagination}` envelopes to bare arrays: `BookingComApi#list_booking_properties` now returns `Array<BookingProperty>`, `BookingComApi#list_booking_conversations` now returns `Array<BookingConversation>`, `VrboApi#vrbo_listings_get` now returns `Array<VrboListing>`. The now-unused wrapper models (`BookingPropertyListResponse`, `BookingConversationListResponse`, `VrboListingListResponse`) were dropped.
  - 4 id fields changed integer → string: `AirbnbAlteration.id`, `AirbnbAlteration.reservationId`, `AirbnbConnection.id`, `AirbnbListing.listingId`.
  - `Property.latitude` / `Property.longitude` changed number → string.

### Notes

- `scripts/check-spec-freshness.py` now compares schema shapes (not just operation counts) and confirms zero drift post-regen.

## [0.2.12] - 2026-09-11

### Added

Four new write operations, present in `lib/repull/`:

- `GuestsApi#create_guest` (`POST /v1/guests`)
- `ReservationsApi#create_reservation` (`POST /v1/reservations`)
- `ReservationsApi#update_reservation` (`PATCH /v1/reservations/{id}`)
- `ConversationsApi#send_conversation_message` (`POST /v1/conversations/{id}/messages`)

### Notes

- Operation-set parity with the live spec verified programmatically post-regen: 174 = 174, zero diff (path count unchanged at 124 — these are new methods on existing paths).

## [0.2.11] - 2026-09-11

### Fixed

- **Synced OpenAPI spec to the live API** (102 → 124 paths). The checked-in `openapi/v1.json` snapshot had drifted from `https://api.repull.dev/openapi.json`.

### Removed

- **Sandbox endpoints and generated code.** `/v1/sandbox/reset` and `/v1/sandbox/seed` were removed from the live API (both now 404; `sk_test_` keys now return 401). Deleted the dead generated surface: `Repull::SandboxApi` and its models (`SandboxFixtureRef`, `SandboxResetResult`, `SandboxResetResultDeleted`, `SandboxSeedResult`) plus their docs pages. Updated the README to stop recommending `sk_test_` keys.

### Added

24 previously-generated-but-unreachable operations, now present in `lib/repull/`:

- `AvailabilityApi#availability_batch_post` (`POST /v1/availability/batch`)
- `AirbnbApi` alteration accept/decline (`POST /v1/channels/airbnb/alterations/{id}/accept`, `.../decline`)
- `BookingComApi#booking_properties_id_rooms_get` (`GET /v1/channels/booking/properties/{id}/rooms`)
- `ConnectApi` credentials-based connect for Beds24, BookingSync, Guesty, Hospitable, Hostaway, iGMS, Lodgify, OwnerRez, Smoobu, VRBO (`POST /v1/connect/{provider}/credentials`)
- `ConnectApi#booking_callback_get` (`GET /v1/connect/booking/callback`)
- `HealthApi` subsystem checks: Atlas, Auth, per-channel, MCP, Webhooks
- `ListingsApi` photo endpoints (`GET/POST /v1/listings/{id}/photos`, `POST /v1/listings/{id}/photos/upload-url`)
- `QuotesApi#quotes_post` (`POST /v1/quotes`)
- `ReviewsApi#reviews_id_reply_post` (`POST /v1/reviews/{id}/reply`)

### Notes

- `scripts/regen.sh` now also patches a missing `id` path-parameter declaration on `POST /v1/reviews/{id}/reply` in the fetched spec (openapi-generator's spec validator rejected the live spec as published). Remove that patch once the live spec declares the parameter itself.
- Path-set parity with the live spec verified programmatically post-regen: local and live `paths` keys are set-equal (124 = 124, zero diff).

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
