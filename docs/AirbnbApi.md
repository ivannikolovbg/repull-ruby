# Repull::AirbnbApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**airbnb_listing_action**](AirbnbApi.md#airbnb_listing_action) | **POST** /v1/channels/airbnb/listings/{id} | Listing action (delete/push/publish/unlist) |
| [**airbnb_reservation_action**](AirbnbApi.md#airbnb_reservation_action) | **POST** /v1/channels/airbnb/reservations/{code} | Accept/decline/cancel Airbnb reservation |
| [**create_airbnb_listing**](AirbnbApi.md#create_airbnb_listing) | **POST** /v1/channels/airbnb/listings | Create/push Airbnb listing |
| [**edit_airbnb_review**](AirbnbApi.md#edit_airbnb_review) | **PUT** /v1/channels/airbnb/reviews/{id} | Edit Airbnb host review |
| [**get_airbnb_connection**](AirbnbApi.md#get_airbnb_connection) | **GET** /v1/channels/airbnb/connection | Get Airbnb connection state |
| [**get_airbnb_listing**](AirbnbApi.md#get_airbnb_listing) | **GET** /v1/channels/airbnb/listings/{id} | Get Airbnb listing |
| [**get_airbnb_listing_availability**](AirbnbApi.md#get_airbnb_listing_availability) | **GET** /v1/channels/airbnb/listings/{id}/availability | Get Airbnb availability |
| [**get_airbnb_listing_pricing**](AirbnbApi.md#get_airbnb_listing_pricing) | **GET** /v1/channels/airbnb/listings/{id}/pricing | Get Airbnb pricing |
| [**get_airbnb_reservation**](AirbnbApi.md#get_airbnb_reservation) | **GET** /v1/channels/airbnb/reservations/{code} | Get Airbnb reservation |
| [**list_airbnb_listing_photos**](AirbnbApi.md#list_airbnb_listing_photos) | **GET** /v1/channels/airbnb/listings/{id}/photos | List Airbnb photos |
| [**list_airbnb_listings**](AirbnbApi.md#list_airbnb_listings) | **GET** /v1/channels/airbnb/listings | List Airbnb listings |
| [**list_airbnb_reservations**](AirbnbApi.md#list_airbnb_reservations) | **GET** /v1/channels/airbnb/reservations | List Airbnb reservations |
| [**list_airbnb_reviews**](AirbnbApi.md#list_airbnb_reviews) | **GET** /v1/channels/airbnb/reviews | List Airbnb reviews |
| [**list_airbnb_thread_messages**](AirbnbApi.md#list_airbnb_thread_messages) | **GET** /v1/channels/airbnb/messaging/{threadId}/messages | Get Airbnb messages |
| [**list_airbnb_threads**](AirbnbApi.md#list_airbnb_threads) | **GET** /v1/channels/airbnb/messaging | List Airbnb message threads |
| [**respond_airbnb_review**](AirbnbApi.md#respond_airbnb_review) | **POST** /v1/channels/airbnb/reviews/{id}/respond | Respond to Airbnb review |
| [**respond_airbnb_review_legacy**](AirbnbApi.md#respond_airbnb_review_legacy) | **POST** /v1/channels/airbnb/reviews | Respond to / submit Airbnb review (legacy) |
| [**send_airbnb_message**](AirbnbApi.md#send_airbnb_message) | **POST** /v1/channels/airbnb/messaging/{threadId}/messages | Send Airbnb message |
| [**sync_airbnb**](AirbnbApi.md#sync_airbnb) | **POST** /v1/channels/airbnb/sync | Bulk sync to Airbnb |
| [**update_airbnb_listing_availability**](AirbnbApi.md#update_airbnb_listing_availability) | **PUT** /v1/channels/airbnb/listings/{id}/availability | Update Airbnb availability |
| [**update_airbnb_listing_pricing**](AirbnbApi.md#update_airbnb_listing_pricing) | **PUT** /v1/channels/airbnb/listings/{id}/pricing | Update Airbnb pricing |
| [**upload_airbnb_listing_photos**](AirbnbApi.md#upload_airbnb_listing_photos) | **POST** /v1/channels/airbnb/listings/{id}/photos | Upload photos to Airbnb |


## airbnb_listing_action

> airbnb_listing_action(id)

Listing action (delete/push/publish/unlist)

Apply a state action to a listing by id.  `delete` is implemented as a **deactivate of the Repull record only** — it sets the listing inactive and KEEPS the row; it does NOT touch the upstream Airbnb listing (Repull never deletes or deactivates on Airbnb's side). Use it to exclude a listing / trim back under the plan-listings cap; reactivate via `PATCH /v1/listings/{id}` with `{ \"active\": true }`. Idempotent.  `push` (sync local changes upstream), `publish` (make publicly bookable), and `unlist` (hide) depend on the host-side sync orchestrator and currently return 501.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # Listing action (delete/push/publish/unlist)
  api_instance.airbnb_listing_action(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_listing_action: #{e}"
end
```

#### Using the airbnb_listing_action_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> airbnb_listing_action_with_http_info(id)

```ruby
begin
  # Listing action (delete/push/publish/unlist)
  data, status_code, headers = api_instance.airbnb_listing_action_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_listing_action_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## airbnb_reservation_action

> airbnb_reservation_action(code)

Accept/decline/cancel Airbnb reservation

Apply a state action to an Airbnb reservation — `accept` / `decline` (for inquiries and reservation requests), `cancel` (host cancellation, carries penalties), `pre-approve` (for inquiries).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
code = 'code_example' # String | 

begin
  # Accept/decline/cancel Airbnb reservation
  api_instance.airbnb_reservation_action(code)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_reservation_action: #{e}"
end
```

#### Using the airbnb_reservation_action_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> airbnb_reservation_action_with_http_info(code)

```ruby
begin
  # Accept/decline/cancel Airbnb reservation
  data, status_code, headers = api_instance.airbnb_reservation_action_with_http_info(code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->airbnb_reservation_action_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## create_airbnb_listing

> <AirbnbListing> create_airbnb_listing

Create/push Airbnb listing

Create a new Airbnb listing or push an existing Repull listing to Airbnb. Requires a connected Airbnb account. Returns the created listing id; publishing happens via the listing-action endpoint.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # Create/push Airbnb listing
  result = api_instance.create_airbnb_listing
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_listing: #{e}"
end
```

#### Using the create_airbnb_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbListing>, Integer, Hash)> create_airbnb_listing_with_http_info

```ruby
begin
  # Create/push Airbnb listing
  data, status_code, headers = api_instance.create_airbnb_listing_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbListing>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->create_airbnb_listing_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AirbnbListing**](AirbnbListing.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## edit_airbnb_review

> <AirbnbReview> edit_airbnb_review(id, airbnb_review)

Edit Airbnb host review

Edit a host-side review for an Airbnb stay. Airbnb collapses POST + PUT into the same upstream call (`PUT /v2/listing_reviews/{id}`), so this endpoint covers both initial submit and subsequent edits while the review window is open.  Body is a partial `AirbnbReview` — pass the fields you want to change (rating, public review, private feedback, category ratings).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Airbnb review id (`HRabc123` style).
airbnb_review = Repull::AirbnbReview.new # AirbnbReview | 

begin
  # Edit Airbnb host review
  result = api_instance.edit_airbnb_review(id, airbnb_review)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->edit_airbnb_review: #{e}"
end
```

#### Using the edit_airbnb_review_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReview>, Integer, Hash)> edit_airbnb_review_with_http_info(id, airbnb_review)

```ruby
begin
  # Edit Airbnb host review
  data, status_code, headers = api_instance.edit_airbnb_review_with_http_info(id, airbnb_review)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReview>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->edit_airbnb_review_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb review id (&#x60;HRabc123&#x60; style). |  |
| **airbnb_review** | [**AirbnbReview**](AirbnbReview.md) |  |  |

### Return type

[**AirbnbReview**](AirbnbReview.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_airbnb_connection

> <AirbnbConnectionResponse> get_airbnb_connection

Get Airbnb connection state

Returns the workspace's Airbnb host connection state in one envelope. Use this instead of inferring connection health from per-listing 401s on `GET /v1/channels/airbnb/listings` — that's noisy (every per-listing call has to fail before you know) and ambiguous (a single 5xx looks identical to a deauth).  Pure DB read — does NOT touch Airbnb's API, so it's cheap to poll from a status-page surface.  The response includes one row per Airbnb host the workspace has linked. Each row carries `isConnected`, `lastSyncedAt`, `deactivatedAt`, and `lastDisconnectReason` (most recent non-backfill row in `airbnb_host_events`).  A self-serve `fixUrl` is included whenever `status` is anything other than `connected` — points at the dashboard where the host re-authorizes (or initiates the first OAuth flow for `never_connected` workspaces).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # Get Airbnb connection state
  result = api_instance.get_airbnb_connection
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_connection: #{e}"
end
```

#### Using the get_airbnb_connection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbConnectionResponse>, Integer, Hash)> get_airbnb_connection_with_http_info

```ruby
begin
  # Get Airbnb connection state
  data, status_code, headers = api_instance.get_airbnb_connection_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbConnectionResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_connection_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AirbnbConnectionResponse**](AirbnbConnectionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_listing

> <AirbnbListing> get_airbnb_listing(id, opts)

Get Airbnb listing

Fetch all Airbnb connection rows for a single Vanio listing id. A property may be linked from multiple Airbnb hosts — every match is returned. Pass `?include=amenities` to enrich each row with its current Airbnb amenities.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 
opts = {
  include: 'amenities' # String | Comma-separated expansions. Currently supported: `amenities`.
}

begin
  # Get Airbnb listing
  result = api_instance.get_airbnb_listing(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing: #{e}"
end
```

#### Using the get_airbnb_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbListing>, Integer, Hash)> get_airbnb_listing_with_http_info(id, opts)

```ruby
begin
  # Get Airbnb listing
  data, status_code, headers = api_instance.get_airbnb_listing_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbListing>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **include** | **String** | Comma-separated expansions. Currently supported: &#x60;amenities&#x60;. | [optional] |

### Return type

[**AirbnbListing**](AirbnbListing.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_airbnb_listing_availability

> get_airbnb_listing_availability(id)

Get Airbnb availability

Read the per-day availability calendar for an Airbnb listing. Returns one row per day including price overrides, min-stay, and blocked status.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # Get Airbnb availability
  api_instance.get_airbnb_listing_availability(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_availability: #{e}"
end
```

#### Using the get_airbnb_listing_availability_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_airbnb_listing_availability_with_http_info(id)

```ruby
begin
  # Get Airbnb availability
  data, status_code, headers = api_instance.get_airbnb_listing_availability_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_airbnb_listing_pricing

> get_airbnb_listing_pricing(id)

Get Airbnb pricing

Read the current pricing config (base price, weekend uplift, length-of-stay discounts, smart-pricing bounds) for an Airbnb listing.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # Get Airbnb pricing
  api_instance.get_airbnb_listing_pricing(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_pricing: #{e}"
end
```

#### Using the get_airbnb_listing_pricing_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_airbnb_listing_pricing_with_http_info(id)

```ruby
begin
  # Get Airbnb pricing
  data, status_code, headers = api_instance.get_airbnb_listing_pricing_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_airbnb_reservation

> <AirbnbReservation> get_airbnb_reservation(code)

Get Airbnb reservation

Fetch a single Airbnb reservation by Airbnb confirmation code (e.g. `HMABCDEF12`).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
code = 'code_example' # String | 

begin
  # Get Airbnb reservation
  result = api_instance.get_airbnb_reservation(code)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_reservation: #{e}"
end
```

#### Using the get_airbnb_reservation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReservation>, Integer, Hash)> get_airbnb_reservation_with_http_info(code)

```ruby
begin
  # Get Airbnb reservation
  data, status_code, headers = api_instance.get_airbnb_reservation_with_http_info(code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReservation>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->get_airbnb_reservation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** |  |  |

### Return type

[**AirbnbReservation**](AirbnbReservation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_listing_photos

> list_airbnb_listing_photos(id)

List Airbnb photos

List photos attached to an Airbnb listing in display order. Returns the public CDN URL plus Airbnb-side metadata (id, caption, room).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # List Airbnb photos
  api_instance.list_airbnb_listing_photos(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_photos: #{e}"
end
```

#### Using the list_airbnb_listing_photos_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> list_airbnb_listing_photos_with_http_info(id)

```ruby
begin
  # List Airbnb photos
  data, status_code, headers = api_instance.list_airbnb_listing_photos_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## list_airbnb_listings

> <AirbnbListingListResponse> list_airbnb_listings(opts)

List Airbnb listings

List every Airbnb listing this workspace has access to via the connected Airbnb account. **Pure DB read — never calls Airbnb upstream.** The connect flow is what populates the local cache; the API serves what's already there. Customers with a disconnected host still see their last-synced data, with the top-level `data_freshness` envelope flagging the staleness and pointing at the reconnect URL.  Pass `?include=amenities` to enrich each connection with its locally-cached amenity set. Returns `null` per connection when the cache is empty.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
opts = {
  include: 'amenities' # String | Comma-separated expansions. Currently supported: `amenities` (adds `amenities` and `accessibility_amenities` arrays to each connection, sourced from the local `listings_airbnb_amenities` cache).
}

begin
  # List Airbnb listings
  result = api_instance.list_airbnb_listings(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listings: #{e}"
end
```

#### Using the list_airbnb_listings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbListingListResponse>, Integer, Hash)> list_airbnb_listings_with_http_info(opts)

```ruby
begin
  # List Airbnb listings
  data, status_code, headers = api_instance.list_airbnb_listings_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbListingListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_listings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **include** | **String** | Comma-separated expansions. Currently supported: &#x60;amenities&#x60; (adds &#x60;amenities&#x60; and &#x60;accessibility_amenities&#x60; arrays to each connection, sourced from the local &#x60;listings_airbnb_amenities&#x60; cache). | [optional] |

### Return type

[**AirbnbListingListResponse**](AirbnbListingListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_reservations

> <AirbnbReservationListResponse> list_airbnb_reservations(opts)

List Airbnb reservations

Cursor-paginated list of reservations sourced directly from Airbnb. Use this when you need Airbnb-specific fields (guest payout split, cancellation policy snapshot) that the unified `/v1/reservations` endpoint flattens away.  Walk pages with `?cursor=<pagination.next_cursor>` until `pagination.has_more` is `false`. The cursor is opaque — never construct or parse it client-side.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`. Internally this walks upstream Airbnb cursor pages to skip rows, so deep offsets cost N/limit upstream round-trips; cursor remains the better choice for deep pagination.  When `status` is omitted, all statuses are returned (Airbnb defaults to `accepted` only on its own surface, but this endpoint normalises to \"all\"). Pass `?status=accepted` to scope.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
opts = {
  cursor: 'cursor_example', # String | Opaque cursor returned by the previous response's `pagination.next_cursor`. Omit to fetch the first page.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.next_cursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  limit: 56, # Integer | Max items per page. Hard cap is 100.
  listing_id: 'listing_id_example', # String | Filter to one Airbnb listing id (numeric string).
  status: 'pending', # String | Filter by reservation status. Omit to receive all statuses.
  start_date: Date.parse('2013-10-20'), # Date | ISO 8601 (YYYY-MM-DD) lower bound on Airbnb's date range filter.
  end_date: Date.parse('2013-10-20'), # Date | ISO 8601 (YYYY-MM-DD) upper bound on Airbnb's date range filter.
  include_total: true # Boolean | Whether to include `pagination.total`. Always populated when Airbnb returns a total count (effectively always); accepted for shape symmetry with the rest of the API.
}

begin
  # List Airbnb reservations
  result = api_instance.list_airbnb_reservations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reservations: #{e}"
end
```

#### Using the list_airbnb_reservations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReservationListResponse>, Integer, Hash)> list_airbnb_reservations_with_http_info(opts)

```ruby
begin
  # List Airbnb reservations
  data, status_code, headers = api_instance.list_airbnb_reservations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReservationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reservations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cursor** | **String** | Opaque cursor returned by the previous response&#39;s &#x60;pagination.next_cursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.next_cursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **limit** | **Integer** | Max items per page. Hard cap is 100. | [optional][default to 50] |
| **listing_id** | **String** | Filter to one Airbnb listing id (numeric string). | [optional] |
| **status** | **String** | Filter by reservation status. Omit to receive all statuses. | [optional] |
| **start_date** | **Date** | ISO 8601 (YYYY-MM-DD) lower bound on Airbnb&#39;s date range filter. | [optional] |
| **end_date** | **Date** | ISO 8601 (YYYY-MM-DD) upper bound on Airbnb&#39;s date range filter. | [optional] |
| **include_total** | **Boolean** | Whether to include &#x60;pagination.total&#x60;. Always populated when Airbnb returns a total count (effectively always); accepted for shape symmetry with the rest of the API. | [optional][default to true] |

### Return type

[**AirbnbReservationListResponse**](AirbnbReservationListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_reviews

> <AirbnbReviewListResponse> list_airbnb_reviews

List Airbnb reviews

List reviews left by guests on Airbnb listings in this workspace. Includes both reviews of the host and reviews of the guest (where the host has not yet submitted theirs).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # List Airbnb reviews
  result = api_instance.list_airbnb_reviews
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reviews: #{e}"
end
```

#### Using the list_airbnb_reviews_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReviewListResponse>, Integer, Hash)> list_airbnb_reviews_with_http_info

```ruby
begin
  # List Airbnb reviews
  data, status_code, headers = api_instance.list_airbnb_reviews_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReviewListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_reviews_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AirbnbReviewListResponse**](AirbnbReviewListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_thread_messages

> <MessageListResponse> list_airbnb_thread_messages(thread_id)

Get Airbnb messages

Fetch the full message log for an Airbnb thread, ordered oldest-to-newest. Walk pages with `?cursor=` until `pagination.hasMore` is `false`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
thread_id = 'thread_id_example' # String | 

begin
  # Get Airbnb messages
  result = api_instance.list_airbnb_thread_messages(thread_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_thread_messages: #{e}"
end
```

#### Using the list_airbnb_thread_messages_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MessageListResponse>, Integer, Hash)> list_airbnb_thread_messages_with_http_info(thread_id)

```ruby
begin
  # Get Airbnb messages
  data, status_code, headers = api_instance.list_airbnb_thread_messages_with_http_info(thread_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MessageListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_thread_messages_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **thread_id** | **String** |  |  |

### Return type

[**MessageListResponse**](MessageListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_threads

> <AirbnbThreadListResponse> list_airbnb_threads

List Airbnb message threads

List Airbnb message threads (one per guest conversation). Cursor-paginated. Each thread includes a preview of the latest message.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # List Airbnb message threads
  result = api_instance.list_airbnb_threads
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_threads: #{e}"
end
```

#### Using the list_airbnb_threads_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbThreadListResponse>, Integer, Hash)> list_airbnb_threads_with_http_info

```ruby
begin
  # List Airbnb message threads
  data, status_code, headers = api_instance.list_airbnb_threads_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbThreadListResponse>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->list_airbnb_threads_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AirbnbThreadListResponse**](AirbnbThreadListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## respond_airbnb_review

> <AirbnbReview> respond_airbnb_review(id, respond_airbnb_review_request)

Respond to Airbnb review

Post a public host response to a guest review. Airbnb allows one response per review — repeated POSTs return 409. Response text is capped at 1000 characters.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | Airbnb review id.
respond_airbnb_review_request = Repull::RespondAirbnbReviewRequest.new({response: 'response_example'}) # RespondAirbnbReviewRequest | 

begin
  # Respond to Airbnb review
  result = api_instance.respond_airbnb_review(id, respond_airbnb_review_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->respond_airbnb_review: #{e}"
end
```

#### Using the respond_airbnb_review_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AirbnbReview>, Integer, Hash)> respond_airbnb_review_with_http_info(id, respond_airbnb_review_request)

```ruby
begin
  # Respond to Airbnb review
  data, status_code, headers = api_instance.respond_airbnb_review_with_http_info(id, respond_airbnb_review_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AirbnbReview>
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->respond_airbnb_review_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb review id. |  |
| **respond_airbnb_review_request** | [**RespondAirbnbReviewRequest**](RespondAirbnbReviewRequest.md) |  |  |

### Return type

[**AirbnbReview**](AirbnbReview.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## respond_airbnb_review_legacy

> respond_airbnb_review_legacy

Respond to / submit Airbnb review (legacy)

Legacy action-based shape. Body `{ action: \"respond\"|\"submit\", reviewId, response?, review? }`. Kept for backwards compatibility — prefer `PUT /v1/channels/airbnb/reviews/{id}` (edit) and `POST /v1/channels/airbnb/reviews/{id}/respond` (reply) for new integrations.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # Respond to / submit Airbnb review (legacy)
  api_instance.respond_airbnb_review_legacy
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->respond_airbnb_review_legacy: #{e}"
end
```

#### Using the respond_airbnb_review_legacy_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> respond_airbnb_review_legacy_with_http_info

```ruby
begin
  # Respond to / submit Airbnb review (legacy)
  data, status_code, headers = api_instance.respond_airbnb_review_legacy_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->respond_airbnb_review_legacy_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## send_airbnb_message

> send_airbnb_message(thread_id)

Send Airbnb message

Send a message in an Airbnb thread as the host. Airbnb enforces content rules (no off-platform contact info, no external URLs) — violating messages are rejected upstream and surface as `airbnb_error`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
thread_id = 'thread_id_example' # String | 

begin
  # Send Airbnb message
  api_instance.send_airbnb_message(thread_id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->send_airbnb_message: #{e}"
end
```

#### Using the send_airbnb_message_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> send_airbnb_message_with_http_info(thread_id)

```ruby
begin
  # Send Airbnb message
  data, status_code, headers = api_instance.send_airbnb_message_with_http_info(thread_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->send_airbnb_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **thread_id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## sync_airbnb

> sync_airbnb

Bulk sync to Airbnb

Push all property data to Airbnb in one call.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new

begin
  # Bulk sync to Airbnb
  api_instance.sync_airbnb
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->sync_airbnb: #{e}"
end
```

#### Using the sync_airbnb_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> sync_airbnb_with_http_info

```ruby
begin
  # Bulk sync to Airbnb
  data, status_code, headers = api_instance.sync_airbnb_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->sync_airbnb_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## update_airbnb_listing_availability

> update_airbnb_listing_availability(id)

Update Airbnb availability

Push per-day availability + pricing overrides to Airbnb. Accepts a sparse map (date → fields) — only included dates are updated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # Update Airbnb availability
  api_instance.update_airbnb_listing_availability(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_availability: #{e}"
end
```

#### Using the update_airbnb_listing_availability_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_airbnb_listing_availability_with_http_info(id)

```ruby
begin
  # Update Airbnb availability
  data, status_code, headers = api_instance.update_airbnb_listing_availability_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## update_airbnb_listing_pricing

> update_airbnb_listing_pricing(id)

Update Airbnb pricing

Push pricing changes to Airbnb. The full pricing object is replaced — to patch a single field, GET first, mutate locally, then PUT the whole object.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # Update Airbnb pricing
  api_instance.update_airbnb_listing_pricing(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_pricing: #{e}"
end
```

#### Using the update_airbnb_listing_pricing_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_airbnb_listing_pricing_with_http_info(id)

```ruby
begin
  # Update Airbnb pricing
  data, status_code, headers = api_instance.update_airbnb_listing_pricing_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->update_airbnb_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## upload_airbnb_listing_photos

> upload_airbnb_listing_photos(id)

Upload photos to Airbnb

Upload one or more photos to an Airbnb listing. Accepts public image URLs (Airbnb fetches them) — direct binary upload is not supported on this endpoint.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AirbnbApi.new
id = 'id_example' # String | 

begin
  # Upload photos to Airbnb
  api_instance.upload_airbnb_listing_photos(id)
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->upload_airbnb_listing_photos: #{e}"
end
```

#### Using the upload_airbnb_listing_photos_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> upload_airbnb_listing_photos_with_http_info(id)

```ruby
begin
  # Upload photos to Airbnb
  data, status_code, headers = api_instance.upload_airbnb_listing_photos_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AirbnbApi->upload_airbnb_listing_photos_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

