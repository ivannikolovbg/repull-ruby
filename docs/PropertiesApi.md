# Repull::PropertiesApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_property**](PropertiesApi.md#get_property) | **GET** /v1/properties/{id} | Get property details (older name for /v1/listings/{id}) |
| [**list_properties**](PropertiesApi.md#list_properties) | **GET** /v1/properties | List properties (older name for /v1/listings) |


## get_property

> <Property> get_property(id, opts)

Get property details (older name for /v1/listings/{id})

**`/v1/properties` is the older name for `/v1/listings`** — the same listings, the same ids. It stays for existing integrations; new code should use `/v1/listings`, which is where create, content, publishing and markups live.  Fetch a single property by Repull id. Property ids are workspace-scoped — an id from one workspace is not valid in another. 404 means the id does not exist OR belongs to a different workspace.  **Optional expansions:** Pass `?include=amenities` to enrich the response with the property's amenities (sourced from the unified `listings_amenities` table). Returns `[]` when the property has no amenity rows. The default response stays lean; consumers must opt in.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PropertiesApi.new
id = 56 # Integer | 
opts = {
  include: 'amenities' # String | Comma-separated optional expansions. Currently supported: `amenities`. Unknown values return 422.
}

begin
  # Get property details (older name for /v1/listings/{id})
  result = api_instance.get_property(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->get_property: #{e}"
end
```

#### Using the get_property_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Property>, Integer, Hash)> get_property_with_http_info(id, opts)

```ruby
begin
  # Get property details (older name for /v1/listings/{id})
  data, status_code, headers = api_instance.get_property_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Property>
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->get_property_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **include** | **String** | Comma-separated optional expansions. Currently supported: &#x60;amenities&#x60;. Unknown values return 422. | [optional] |

### Return type

[**Property**](Property.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_properties

> <PropertyListResponse> list_properties(opts)

List properties (older name for /v1/listings)

**`/v1/properties` is the older name for `/v1/listings`** — the same listings, the same ids. It stays for existing integrations; new code should use `/v1/listings`, which is where create, content, publishing and markups live.  Cursor-paginated list of properties for the authenticated workspace. Walk pages with `?cursor=<pagination.nextCursor>`; stop when `pagination.hasMore` is `false`. Cursor is opaque base64 — do not parse it.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`.  Filters: `q` (substring on name/street/city), `status` (active|inactive|all), `lifecycle_status` (exact match on the listing's lifecycle state). Other unknown params (e.g. `?search=` or `?propertyId=`) are rejected with 422 — no silent unfiltered results.  **Incremental sync (only changes since last poll):** pass `?updated_since=<ISO8601>` to receive only properties changed at or after that instant. Each property carries `updatedAt` — the last row of the final page is your next watermark. `updated_since` changes the page ordering to `updatedAt ASC, id ASC` (and the cursor with it); see the parameter description. `GET /v1/listings` does NOT yet accept `updated_since` — use this endpoint for property-side incremental sync.  **Inactive properties:** an inactive property keeps syncing, but cannot be read or changed through the API until it is activated. They are only listed when `status` asks for them, and then with `id`, `name`, `status`, `lifecycleStatus`, `channels` and `updatedAt` only — enough to choose what to activate with `PATCH /v1/listings/{id}`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PropertiesApi.new
opts = {
  limit: 56, # Integer | Page size (max 100). Requests over the cap return 422.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`. Omit to fetch the first page.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.nextCursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  q: 'q_example', # String | Case-insensitive substring search on name, street, or city.
  status: 'active', # String | Filter by status. Default returns active only; pass `inactive` to invert or `all` to include both. Inactive properties carry identity fields only — `id`, `name`, `status`, `lifecycleStatus`, `channels` and `updatedAt` — never `address`, `city` or `currency`.
  lifecycle_status: 'live', # String | Filter by lifecycle status (e.g. `live`, `draft`, `archived`). Pass `all` to disable the filter.
  channel: 'airbnb', # String | Filter to properties with an active link on the given OTA/channel (airbnb, booking, vrbo). Omit to include every channel. Each property also returns a `channels` array listing the OTAs it is published on.
  updated_since: Time.parse('2026-08-01T00:00Z'), # Time | Incremental sync: return only records whose `updatedAt` is at or after this instant. This is the only filter on record **mutation** time — every `check_*` filter targets guest **stay** dates.  **Accepted formats.** ISO 8601, with `Z` or a numeric offset — both work: - `2026-08-01T00:00:00Z` - `2026-08-01T00:00:00.123Z` - `2026-08-01T00:00:00+00:00` - `2026-08-01T02:30:00-07:00` (offset colon optional: `-0700`) - `2026-08-01T00:00` (seconds optional) - `2026-08-01T00:00:00` — no zone designator, interpreted as **UTC** - `2026-08-01` — date only, means midnight UTC  Anything else returns 422 `invalid_params` naming the field; the value is never silently ignored.  **Ordering changes when you pass this.** Results are ordered `updatedAt ASC, id ASC` (instead of the endpoint default) and the cursor keys on the same pair. That is required for correctness: under the default ordering a record amended mid-walk can move behind the cursor and never be emitted — which is exactly the event you are polling for. Ascending mutation time is monotonic with the cursor, so anything touched during a walk resurfaces later in it or on the next poll.  **Cursors are not interchangeable between the two orderings.** Keep `updated_since` on every page of an incremental walk; replaying a cursor from the other ordering returns 422 rather than a page that silently skips rows.  **Watermark.** The bound is inclusive (`updatedAt >= value`), so the last row of the final page is the watermark for the next poll — re-polling with it re-emits that row. Delivery is at-least-once; upsert by `id`.
  include_total: true # Boolean | When `true` (default), the response's `pagination.total` carries the count of rows matching the current filter, across all pages. Pass `false` to skip the count for very large workspaces where the per-page COUNT(*) cost matters.
}

begin
  # List properties (older name for /v1/listings)
  result = api_instance.list_properties(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->list_properties: #{e}"
end
```

#### Using the list_properties_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PropertyListResponse>, Integer, Hash)> list_properties_with_http_info(opts)

```ruby
begin
  # List properties (older name for /v1/listings)
  data, status_code, headers = api_instance.list_properties_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PropertyListResponse>
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->list_properties_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | Page size (max 100). Requests over the cap return 422. | [optional][default to 50] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **q** | **String** | Case-insensitive substring search on name, street, or city. | [optional] |
| **status** | **String** | Filter by status. Default returns active only; pass &#x60;inactive&#x60; to invert or &#x60;all&#x60; to include both. Inactive properties carry identity fields only — &#x60;id&#x60;, &#x60;name&#x60;, &#x60;status&#x60;, &#x60;lifecycleStatus&#x60;, &#x60;channels&#x60; and &#x60;updatedAt&#x60; — never &#x60;address&#x60;, &#x60;city&#x60; or &#x60;currency&#x60;. | [optional][default to &#39;active&#39;] |
| **lifecycle_status** | **String** | Filter by lifecycle status (e.g. &#x60;live&#x60;, &#x60;draft&#x60;, &#x60;archived&#x60;). Pass &#x60;all&#x60; to disable the filter. | [optional] |
| **channel** | **String** | Filter to properties with an active link on the given OTA/channel (airbnb, booking, vrbo). Omit to include every channel. Each property also returns a &#x60;channels&#x60; array listing the OTAs it is published on. | [optional] |
| **updated_since** | **Time** | Incremental sync: return only records whose &#x60;updatedAt&#x60; is at or after this instant. This is the only filter on record **mutation** time — every &#x60;check_*&#x60; filter targets guest **stay** dates.  **Accepted formats.** ISO 8601, with &#x60;Z&#x60; or a numeric offset — both work: - &#x60;2026-08-01T00:00:00Z&#x60; - &#x60;2026-08-01T00:00:00.123Z&#x60; - &#x60;2026-08-01T00:00:00+00:00&#x60; - &#x60;2026-08-01T02:30:00-07:00&#x60; (offset colon optional: &#x60;-0700&#x60;) - &#x60;2026-08-01T00:00&#x60; (seconds optional) - &#x60;2026-08-01T00:00:00&#x60; — no zone designator, interpreted as **UTC** - &#x60;2026-08-01&#x60; — date only, means midnight UTC  Anything else returns 422 &#x60;invalid_params&#x60; naming the field; the value is never silently ignored.  **Ordering changes when you pass this.** Results are ordered &#x60;updatedAt ASC, id ASC&#x60; (instead of the endpoint default) and the cursor keys on the same pair. That is required for correctness: under the default ordering a record amended mid-walk can move behind the cursor and never be emitted — which is exactly the event you are polling for. Ascending mutation time is monotonic with the cursor, so anything touched during a walk resurfaces later in it or on the next poll.  **Cursors are not interchangeable between the two orderings.** Keep &#x60;updated_since&#x60; on every page of an incremental walk; replaying a cursor from the other ordering returns 422 rather than a page that silently skips rows.  **Watermark.** The bound is inclusive (&#x60;updatedAt &gt;&#x3D; value&#x60;), so the last row of the final page is the watermark for the next poll — re-polling with it re-emits that row. Delivery is at-least-once; upsert by &#x60;id&#x60;. | [optional] |
| **include_total** | **Boolean** | When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. | [optional][default to true] |

### Return type

[**PropertyListResponse**](PropertyListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

