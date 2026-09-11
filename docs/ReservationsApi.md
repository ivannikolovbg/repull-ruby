# Repull::ReservationsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_reservation**](ReservationsApi.md#get_reservation) | **GET** /v1/reservations/{id} | Get reservation details |
| [**list_reservations**](ReservationsApi.md#list_reservations) | **GET** /v1/reservations | List reservations |


## get_reservation

> <Reservation> get_reservation(id, opts)

Get reservation details

Returns the full record for a single reservation, scoped to the authenticated workspace. Response shape is identical to a single row in `GET /v1/reservations` so SDK consumers can use the same type for both. Returns **404** if the id does not exist OR belongs to a different workspace — the API never differentiates the two so caller can't enumerate other workspaces' ids.

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

Cursor-paginated list of reservations across all connected PMS platforms. Filter by platform, status, listing, or check-in date range.  **Pagination:** Walk pages with `?cursor=` — pass `pagination.nextCursor` from one response back as `?cursor=` on the next request. Stop when `pagination.hasMore` is `false`. `limit` defaults to 50, max 100; requesting more returns 422 (no silent truncation).  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`. For deep pagination cursor remains O(1) per page; offset > 10000 returns 422 with a docs link.  **Incremental sync (only changes since last poll):** pass `?updated_since=<ISO8601>` to receive only reservations amended, cancelled, or created at or after that instant — no full re-walk. Each row carries `updatedAt`; the last row of the final page is your next watermark. Note that `updated_since` changes the page ordering to `updatedAt ASC, id ASC` (and the cursor with it) so mid-walk amendments cannot be skipped — see the parameter description for the full contract.

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
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.next_cursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  platform: 'platform_example', # String | Filter by booking platform
  status: 'confirmed', # String | Filter by lifecycle status. **Case-insensitive** — `confirmed`, `Confirmed`, and `CONFIRMED` all match. Each public value expands to the full set of internal sub-states server-side: `confirmed` matches `accept`/`confirmed`/`modified`, `cancelled` matches every cancellation sub-state (`cancelled_by_host`, `declined`, `expired`, etc.), `pending` includes `inquiry`/`awaiting_payment`. `completed` is a derived state — combine `status=confirmed` with `check_out_before=<today>` to filter for past stays.
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
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.next_cursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **platform** | **String** | Filter by booking platform | [optional] |
| **status** | **String** | Filter by lifecycle status. **Case-insensitive** — &#x60;confirmed&#x60;, &#x60;Confirmed&#x60;, and &#x60;CONFIRMED&#x60; all match. Each public value expands to the full set of internal sub-states server-side: &#x60;confirmed&#x60; matches &#x60;accept&#x60;/&#x60;confirmed&#x60;/&#x60;modified&#x60;, &#x60;cancelled&#x60; matches every cancellation sub-state (&#x60;cancelled_by_host&#x60;, &#x60;declined&#x60;, &#x60;expired&#x60;, etc.), &#x60;pending&#x60; includes &#x60;inquiry&#x60;/&#x60;awaiting_payment&#x60;. &#x60;completed&#x60; is a derived state — combine &#x60;status&#x3D;confirmed&#x60; with &#x60;check_out_before&#x3D;&lt;today&gt;&#x60; to filter for past stays. | [optional] |
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

