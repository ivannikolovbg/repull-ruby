# Repull::ReservationsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**accept_reservation_request**](ReservationsApi.md#accept_reservation_request) | **POST** /v1/reservations/{id}/accept | Accept a booking request |
| [**create_reservation**](ReservationsApi.md#create_reservation) | **POST** /v1/reservations | Create a reservation |
| [**decline_reservation_request**](ReservationsApi.md#decline_reservation_request) | **POST** /v1/reservations/{id}/decline | Decline a booking request |
| [**get_reservation**](ReservationsApi.md#get_reservation) | **GET** /v1/reservations/{id} | Get reservation details |
| [**list_reservations**](ReservationsApi.md#list_reservations) | **GET** /v1/reservations | List reservations |
| [**update_reservation**](ReservationsApi.md#update_reservation) | **PATCH** /v1/reservations/{id} | Update a reservation |


## accept_reservation_request

> <AcceptReservationRequest200Response> accept_reservation_request(id, opts)

Accept a booking request

Accept a pending Airbnb booking request — a reservation with status `pending`, made on a listing without Instant Book. Find them with `GET /v1/reservations?status=pending`. Airbnb expires a request the host has not answered within 24 hours.  Airbnb confirms asynchronously: the reservation’s status moves to confirmed, and a `reservation.updated` webhook fires, when Airbnb’s notification lands (usually within seconds). The response reports what Airbnb was asked to do.  **Airbnb only**, and only for listings connected to Airbnb directly: other channels have no request step (`422 channel_not_supported`). A reservation that is not pending is refused before Airbnb is contacted (`409 reservation_not_pending`); one Airbnb says already moved on is `409 request_no_longer_pending`. Neither is worth retrying.  Takes no body.  Send `Idempotency-Key`: a repeat with the same key replays the first response instead of acting twice (a `409 idempotency_key_in_use` while the first is still running). A 5xx, a `429 airbnb_rate_limited` or a `403 connection_reauth_required` is not stored — nothing was done — so retrying with the same key reaches Airbnb again.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
id = 56 # Integer | Repull reservation id (from `GET /v1/reservations?status=pending`) — not the Airbnb confirmation code.
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Accept a booking request
  result = api_instance.accept_reservation_request(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->accept_reservation_request: #{e}"
end
```

#### Using the accept_reservation_request_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AcceptReservationRequest200Response>, Integer, Hash)> accept_reservation_request_with_http_info(id, opts)

```ruby
begin
  # Accept a booking request
  data, status_code, headers = api_instance.accept_reservation_request_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AcceptReservationRequest200Response>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->accept_reservation_request_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull reservation id (from &#x60;GET /v1/reservations?status&#x3D;pending&#x60;) — not the Airbnb confirmation code. |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**AcceptReservationRequest200Response**](AcceptReservationRequest200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_reservation

> <ReservationCreateResponse> create_reservation(reservation_create_request, opts)

Create a reservation

Creates a reservation and everything that hangs off one: the guest, the conversation thread, the dashboard item, the calendar block, and the `reservation.created` fan-out that issues the door code and starts the messaging automations.  **Platform is restricted to `direct`, `website` and `owner`.** Reservations on Airbnb, Booking.com and Vrbo are owned by the channel and arrive through sync — creating one here would mint a local booking the channel has never heard of, which then fights the next sync. Create those on the channel.  **Dates are validated** (`YYYY-MM-DD`, and `checkOut` must be after `checkIn`), and an unrecognised field is rejected by name rather than silently ignored.  **This endpoint does not set the price.** There is no `totalPrice` field: the reservation pipeline derives the price breakdown from the property's own rates and overwrites anything supplied, so accepting a total would be taking a value and discarding it. A reservation created here is priced by that engine (`0` when the property has no rates for the range). `currency` IS honoured. Quote a stay with `GET /v1/quotes` before booking if you need the figure up front.  **Availability is NOT checked.** This creates the reservation you asked for even if the dates overlap an existing booking. Call `GET /v1/availability/{propertyId}` first if that matters.  Send `Idempotency-Key` — a network timeout here is exactly the case it exists for: without it, a retry books the guest twice.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
reservation_create_request = Repull::ReservationCreateRequest.new({listing_id: 4118, check_in: Date.parse('Thu Oct 01 00:00:00 UTC 2026'), check_out: Date.parse('Mon Oct 05 00:00:00 UTC 2026'), guest: Repull::ReservationGuestInput.new({first_name: 'Ada'})}) # ReservationCreateRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Create a reservation
  result = api_instance.create_reservation(reservation_create_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->create_reservation: #{e}"
end
```

#### Using the create_reservation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReservationCreateResponse>, Integer, Hash)> create_reservation_with_http_info(reservation_create_request, opts)

```ruby
begin
  # Create a reservation
  data, status_code, headers = api_instance.create_reservation_with_http_info(reservation_create_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReservationCreateResponse>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->create_reservation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_create_request** | [**ReservationCreateRequest**](ReservationCreateRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**ReservationCreateResponse**](ReservationCreateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## decline_reservation_request

> <AcceptReservationRequest200Response> decline_reservation_request(id, decline_reservation_request_request, opts)

Decline a booking request

Decline a pending Airbnb booking request (a reservation with status `pending`; find them with `GET /v1/reservations?status=pending`).  `reason` must be one of Airbnb’s own decline reasons. `message` is required: Airbnb sends it to the guest with the decline (at most 500 characters). It is not defaulted — a canned message would put words in your mouth.  Airbnb confirms asynchronously; the reservation’s status moves, and `reservation.updated` fires, when its notification lands. Same channel and status rules as `POST /v1/reservations/{id}/accept`.  Send `Idempotency-Key`: a repeat with the same key replays the first response instead of acting twice (a `409 idempotency_key_in_use` while the first is still running). A 5xx, a `429 airbnb_rate_limited` or a `403 connection_reauth_required` is not stored — nothing was done — so retrying with the same key reaches Airbnb again.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
id = 56 # Integer | Repull reservation id (from `GET /v1/reservations?status=pending`) — not the Airbnb confirmation code.
decline_reservation_request_request = Repull::DeclineReservationRequestRequest.new({reason: 'dates_not_available', message: 'Sorry, those dates are no longer available.'}) # DeclineReservationRequestRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Decline a booking request
  result = api_instance.decline_reservation_request(id, decline_reservation_request_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->decline_reservation_request: #{e}"
end
```

#### Using the decline_reservation_request_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AcceptReservationRequest200Response>, Integer, Hash)> decline_reservation_request_with_http_info(id, decline_reservation_request_request, opts)

```ruby
begin
  # Decline a booking request
  data, status_code, headers = api_instance.decline_reservation_request_with_http_info(id, decline_reservation_request_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AcceptReservationRequest200Response>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->decline_reservation_request_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull reservation id (from &#x60;GET /v1/reservations?status&#x3D;pending&#x60;) — not the Airbnb confirmation code. |  |
| **decline_reservation_request_request** | [**DeclineReservationRequestRequest**](DeclineReservationRequestRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**AcceptReservationRequest200Response**](AcceptReservationRequest200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_reservation

> <Reservation> get_reservation(id, opts)

Get reservation details

Returns the full record for a single reservation, scoped to the authenticated workspace. Response shape is identical to a single row in `GET /v1/reservations` so SDK consumers can use the same type for both. Returns **404** if the id does not exist OR belongs to a different workspace — the API never differentiates the two so caller can't enumerate other workspaces' ids.  Returns `403 listing_inactive` when the listing this resolves to is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
id = 56 # Integer | Internal Repull reservation ID.
opts = {
  x_schema: 'my-app-schema' # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
}

begin
  # Get reservation details
  result = api_instance.get_reservation(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->get_reservation: #{e}"
end
```

#### Using the get_reservation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Reservation>, Integer, Hash)> get_reservation_with_http_info(id, opts)

```ruby
begin
  # Get reservation details
  data, status_code, headers = api_instance.get_reservation_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Reservation>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->get_reservation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull reservation ID. |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |

### Return type

[**Reservation**](Reservation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_reservations

> <ReservationListResponse> list_reservations(opts)

List reservations

Cursor-paginated list of reservations across all connected PMS platforms. Filter by platform, status, listing, or check-in date range.  **Pagination:** Walk pages with `?cursor=` — pass `pagination.nextCursor` from one response back as `?cursor=` on the next request. Stop when `pagination.hasMore` is `false`. `limit` defaults to 50, max 100; requesting more returns 422 (no silent truncation).  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`. For deep pagination cursor remains O(1) per page; offset > 10000 returns 422 with a docs link.  **Incremental sync (only changes since last poll):** pass `?updated_since=<ISO8601>` to receive only reservations amended, cancelled, or created at or after that instant — no full re-walk. Each row carries `updatedAt`; the last row of the final page is your next watermark. Note that `updated_since` changes the page ordering to `updatedAt ASC, id ASC` (and the cursor with it) so mid-walk amendments cannot be skipped — see the parameter description for the full contract.  Reservations on inactive listings are left out (counts and cursors included); they keep syncing and reappear once the listing is activated. Filtering by an inactive listing (`listing_id`) returns `403 listing_inactive`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
opts = {
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  limit: 56, # Integer | Page size (max 100). Requests over the cap return 422.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`. Omit to fetch the first page.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.nextCursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  platform: 'platform_example', # String | Filter by booking platform
  status: 'confirmed', # String | Filter by lifecycle status. **Case-insensitive** — `confirmed`, `Confirmed`, and `CONFIRMED` all match. Each public value expands to the full set of internal sub-states server-side: `confirmed` matches `accept`/`confirmed`/`modified`, `cancelled` matches every cancellation sub-state (`cancelled_by_host`, `declined`, `expired`, etc.), `pending` covers three different situations, told apart by `pendingReason` on each reservation: a booking **request** awaiting the host (`host_approval` — answer it with `POST /v1/reservations/{id}/accept` or `/decline` before its `respondBy`), and a booking Airbnb is holding for the guest to pay (`guest_payment`) or to complete identity verification (`guest_verification`), which need no action from the host. `completed` is a derived state — combine `status=confirmed` with `check_out_before=<today>` to filter for past stays. `pending` lists only bookings that can still go ahead: a request the channel already let lapse (Airbnb expires a request 24 hours after the guest asks) and any pending booking whose check-in date has passed are left out and appear under `cancelled` with `statusDetail: \"request_expired\"` instead. The stored record is not changed — this is derived when you read it. Airbnb **inquiries** (questions before booking) are not reservations: list them with `GET /v1/inquiries`.
  listing_id: 56, # Integer | Filter to a single listing
  check_in_after: Date.parse('Sun May 31 00:00:00 UTC 2026'), # Date | Check-in date >= this value
  check_in_before: Date.parse('Sun May 31 00:00:00 UTC 2026'), # Date | Check-in date <= this value
  check_out_after: Date.parse('Sun May 31 00:00:00 UTC 2026'), # Date | Check-out date >= this value
  check_out_before: Date.parse('Sun May 31 00:00:00 UTC 2026'), # Date | Check-out date <= this value
  check_in_from: Date.parse('2013-10-20'), # Date | Deprecated alias for `check_in_after`.
  check_in_to: Date.parse('2013-10-20'), # Date | Deprecated alias for `check_in_before`.
  check_in_after2: Date.parse('2013-10-20'), # Date | Use `check_in_after` (snake_case) instead.
  check_in_before2: Date.parse('2013-10-20'), # Date | Use `check_in_before` (snake_case) instead.
  check_out_after2: Date.parse('2013-10-20'), # Date | Use `check_out_after` (snake_case) instead.
  check_out_before2: Date.parse('2013-10-20'), # Date | Use `check_out_before` (snake_case) instead.
  updated_since: Time.parse('2026-08-01T00:00Z'), # Time | Incremental sync: return only records whose `updatedAt` is at or after this instant. This is the only filter on record **mutation** time — every `check_*` filter targets guest **stay** dates.  **Accepted formats.** ISO 8601, with `Z` or a numeric offset — both work: - `2026-08-01T00:00:00Z` - `2026-08-01T00:00:00.123Z` - `2026-08-01T00:00:00+00:00` - `2026-08-01T02:30:00-07:00` (offset colon optional: `-0700`) - `2026-08-01T00:00` (seconds optional) - `2026-08-01T00:00:00` — no zone designator, interpreted as **UTC** - `2026-08-01` — date only, means midnight UTC  Anything else returns 422 `invalid_params` naming the field; the value is never silently ignored.  **Ordering changes when you pass this.** Results are ordered `updatedAt ASC, id ASC` (instead of the endpoint default) and the cursor keys on the same pair. That is required for correctness: under the default ordering a record amended mid-walk can move behind the cursor and never be emitted — which is exactly the event you are polling for. Ascending mutation time is monotonic with the cursor, so anything touched during a walk resurfaces later in it or on the next poll.  **Cursors are not interchangeable between the two orderings.** Keep `updated_since` on every page of an incremental walk; replaying a cursor from the other ordering returns 422 rather than a page that silently skips rows.  **Watermark.** The bound is inclusive (`updatedAt >= value`), so the last row of the final page is the watermark for the next poll — re-polling with it re-emits that row. Delivery is at-least-once; upsert by `id`.
  include_total: true # Boolean | When `true` (default), the response's `pagination.total` carries the count of rows matching the current filter, across all pages. Pass `false` to skip the count for very large workspaces where the per-page COUNT(*) cost matters.
}

begin
  # List reservations
  result = api_instance.list_reservations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->list_reservations: #{e}"
end
```

#### Using the list_reservations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReservationListResponse>, Integer, Hash)> list_reservations_with_http_info(opts)

```ruby
begin
  # List reservations
  data, status_code, headers = api_instance.list_reservations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReservationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->list_reservations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **limit** | **Integer** | Page size (max 100). Requests over the cap return 422. | [optional][default to 50] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **platform** | **String** | Filter by booking platform | [optional] |
| **status** | **String** | Filter by lifecycle status. **Case-insensitive** — &#x60;confirmed&#x60;, &#x60;Confirmed&#x60;, and &#x60;CONFIRMED&#x60; all match. Each public value expands to the full set of internal sub-states server-side: &#x60;confirmed&#x60; matches &#x60;accept&#x60;/&#x60;confirmed&#x60;/&#x60;modified&#x60;, &#x60;cancelled&#x60; matches every cancellation sub-state (&#x60;cancelled_by_host&#x60;, &#x60;declined&#x60;, &#x60;expired&#x60;, etc.), &#x60;pending&#x60; covers three different situations, told apart by &#x60;pendingReason&#x60; on each reservation: a booking **request** awaiting the host (&#x60;host_approval&#x60; — answer it with &#x60;POST /v1/reservations/{id}/accept&#x60; or &#x60;/decline&#x60; before its &#x60;respondBy&#x60;), and a booking Airbnb is holding for the guest to pay (&#x60;guest_payment&#x60;) or to complete identity verification (&#x60;guest_verification&#x60;), which need no action from the host. &#x60;completed&#x60; is a derived state — combine &#x60;status&#x3D;confirmed&#x60; with &#x60;check_out_before&#x3D;&lt;today&gt;&#x60; to filter for past stays. &#x60;pending&#x60; lists only bookings that can still go ahead: a request the channel already let lapse (Airbnb expires a request 24 hours after the guest asks) and any pending booking whose check-in date has passed are left out and appear under &#x60;cancelled&#x60; with &#x60;statusDetail: \&quot;request_expired\&quot;&#x60; instead. The stored record is not changed — this is derived when you read it. Airbnb **inquiries** (questions before booking) are not reservations: list them with &#x60;GET /v1/inquiries&#x60;. | [optional] |
| **listing_id** | **Integer** | Filter to a single listing | [optional] |
| **check_in_after** | **Date** | Check-in date &gt;&#x3D; this value | [optional] |
| **check_in_before** | **Date** | Check-in date &lt;&#x3D; this value | [optional] |
| **check_out_after** | **Date** | Check-out date &gt;&#x3D; this value | [optional] |
| **check_out_before** | **Date** | Check-out date &lt;&#x3D; this value | [optional] |
| **check_in_from** | **Date** | Deprecated alias for &#x60;check_in_after&#x60;. | [optional] |
| **check_in_to** | **Date** | Deprecated alias for &#x60;check_in_before&#x60;. | [optional] |
| **check_in_after2** | **Date** | Use &#x60;check_in_after&#x60; (snake_case) instead. | [optional] |
| **check_in_before2** | **Date** | Use &#x60;check_in_before&#x60; (snake_case) instead. | [optional] |
| **check_out_after2** | **Date** | Use &#x60;check_out_after&#x60; (snake_case) instead. | [optional] |
| **check_out_before2** | **Date** | Use &#x60;check_out_before&#x60; (snake_case) instead. | [optional] |
| **updated_since** | **Time** | Incremental sync: return only records whose &#x60;updatedAt&#x60; is at or after this instant. This is the only filter on record **mutation** time — every &#x60;check_*&#x60; filter targets guest **stay** dates.  **Accepted formats.** ISO 8601, with &#x60;Z&#x60; or a numeric offset — both work: - &#x60;2026-08-01T00:00:00Z&#x60; - &#x60;2026-08-01T00:00:00.123Z&#x60; - &#x60;2026-08-01T00:00:00+00:00&#x60; - &#x60;2026-08-01T02:30:00-07:00&#x60; (offset colon optional: &#x60;-0700&#x60;) - &#x60;2026-08-01T00:00&#x60; (seconds optional) - &#x60;2026-08-01T00:00:00&#x60; — no zone designator, interpreted as **UTC** - &#x60;2026-08-01&#x60; — date only, means midnight UTC  Anything else returns 422 &#x60;invalid_params&#x60; naming the field; the value is never silently ignored.  **Ordering changes when you pass this.** Results are ordered &#x60;updatedAt ASC, id ASC&#x60; (instead of the endpoint default) and the cursor keys on the same pair. That is required for correctness: under the default ordering a record amended mid-walk can move behind the cursor and never be emitted — which is exactly the event you are polling for. Ascending mutation time is monotonic with the cursor, so anything touched during a walk resurfaces later in it or on the next poll.  **Cursors are not interchangeable between the two orderings.** Keep &#x60;updated_since&#x60; on every page of an incremental walk; replaying a cursor from the other ordering returns 422 rather than a page that silently skips rows.  **Watermark.** The bound is inclusive (&#x60;updatedAt &gt;&#x3D; value&#x60;), so the last row of the final page is the watermark for the next poll — re-polling with it re-emits that row. Delivery is at-least-once; upsert by &#x60;id&#x60;. | [optional] |
| **include_total** | **Boolean** | When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. | [optional][default to true] |

### Return type

[**ReservationListResponse**](ReservationListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_reservation

> <ReservationUpdateResponse> update_reservation(id, reservation_update_request, opts)

Update a reservation

Changes the dates, the occupancy, or the unit. Drives the same command path the dashboard does, so the side effects come with it: the change audit is appended, bound task due dates re-sync, the old calendar dates unblock and the new ones block, the conversation's cached listing is invalidated, and `reservation.updated` fires — which is what revokes and re-issues the door code.  Supply at least one field; an empty body returns 422 rather than a 200 that changed nothing.  **Moving and re-dating in one call is one operation.** Send `listingId` together with `checkIn`/`checkOut` and it is applied as a single move, so the access code is re-issued once rather than twice.  ### Fields this endpoint deliberately does NOT accept  Each is rejected by name with the reason, never accepted and ignored:  | Field | Why | |---|---| | `guest` / `guestDetails` | Guest name, email and phone live on the guest record. The underlying command has no branch for them, so accepting them would return a success that changed nothing. | | `pricing` / `totalPrice` / `currency` | Repricing writes the price breakdown, the pricing row and a pricing-history entry. It belongs to its own endpoint. | | `status` | Not a field. Cancelling, confirming and checking out are separate operations with materially different side effects — cancellation issues a credit refund and revokes access codes. | | `platform` | Immutable: it records where the booking actually originated. | | `notes` | `internal_notes` is an append-only audit trail the system writes on every change. |  **Availability is NOT checked.** A date change that overlaps another booking will be written. Call `GET /v1/availability/{propertyId}` first if that matters.  Returns `403 listing_inactive` when the reservation is on an inactive listing, or when a `listingId` move targets one; nothing is changed.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
id = 56 # Integer | Internal Repull reservation ID.
reservation_update_request = Repull::ReservationUpdateRequest.new # ReservationUpdateRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Update a reservation
  result = api_instance.update_reservation(id, reservation_update_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->update_reservation: #{e}"
end
```

#### Using the update_reservation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReservationUpdateResponse>, Integer, Hash)> update_reservation_with_http_info(id, reservation_update_request, opts)

```ruby
begin
  # Update a reservation
  data, status_code, headers = api_instance.update_reservation_with_http_info(id, reservation_update_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReservationUpdateResponse>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->update_reservation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull reservation ID. |  |
| **reservation_update_request** | [**ReservationUpdateRequest**](ReservationUpdateRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**ReservationUpdateResponse**](ReservationUpdateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

