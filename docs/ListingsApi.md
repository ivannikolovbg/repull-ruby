# Repull::ListingsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_listing**](ListingsApi.md#create_listing) | **POST** /v1/listings | Create a Repull listing |
| [**generate_listing_content**](ListingsApi.md#generate_listing_content) | **POST** /v1/listings/{id}/generate-content | AI-generate listing content |
| [**get_listing**](ListingsApi.md#get_listing) | **GET** /v1/listings/{id} | Get a listing |
| [**get_listing_publish_status**](ListingsApi.md#get_listing_publish_status) | **GET** /v1/listings/{id}/publish-status | Per-channel publish status |
| [**list_listings**](ListingsApi.md#list_listings) | **GET** /v1/listings | List listings |
| [**publish_listing_to_airbnb**](ListingsApi.md#publish_listing_to_airbnb) | **POST** /v1/listings/{id}/publish/airbnb | Publish a listing to Airbnb |
| [**publish_listing_to_booking**](ListingsApi.md#publish_listing_to_booking) | **POST** /v1/listings/{id}/publish/booking | Publish a listing to Booking.com |


## create_listing

> <ListingCreateResponse> create_listing(listing_create_request)

Create a Repull listing

Create a new vacation-rental listing under the authenticated workspace. The listing is stored in the canonical Vanio listings tables and can be published to multiple channels (Airbnb, Booking.com) via the publish endpoints.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
listing_create_request = Repull::ListingCreateRequest.new({name: 'Sunset Loft #2'}) # ListingCreateRequest | 

begin
  # Create a Repull listing
  result = api_instance.create_listing(listing_create_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->create_listing: #{e}"
end
```

#### Using the create_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingCreateResponse>, Integer, Hash)> create_listing_with_http_info(listing_create_request)

```ruby
begin
  # Create a Repull listing
  data, status_code, headers = api_instance.create_listing_with_http_info(listing_create_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingCreateResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->create_listing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_create_request** | [**ListingCreateRequest**](ListingCreateRequest.md) |  |  |

### Return type

[**ListingCreateResponse**](ListingCreateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## generate_listing_content

> <ListingGenerateContentResponse> generate_listing_content(id, opts)

AI-generate listing content

Generate guest-facing copy (title, summary, description, amenities, etc.) for a listing using Repull AI. When `photos` are provided the vision model is used for photo-grounded copy. Persists into the listing by default.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | 
opts = {
  listing_generate_content_request: Repull::ListingGenerateContentRequest.new # ListingGenerateContentRequest | 
}

begin
  # AI-generate listing content
  result = api_instance.generate_listing_content(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->generate_listing_content: #{e}"
end
```

#### Using the generate_listing_content_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingGenerateContentResponse>, Integer, Hash)> generate_listing_content_with_http_info(id, opts)

```ruby
begin
  # AI-generate listing content
  data, status_code, headers = api_instance.generate_listing_content_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingGenerateContentResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->generate_listing_content_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **listing_generate_content_request** | [**ListingGenerateContentRequest**](ListingGenerateContentRequest.md) |  | [optional] |

### Return type

[**ListingGenerateContentResponse**](ListingGenerateContentResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_listing

> <Listing> get_listing(id, opts)

Get a listing

Fetch a single listing by id. Returns the same shape as one element of the `GET /v1/listings` response, so you can bind the result to the same model. Cross-tenant access (a listing that belongs to a different workspace) returns 404 — never 403, never reveals the listing's existence.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | Repull listing id
opts = {
  x_schema: 'my-app-schema' # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
}

begin
  # Get a listing
  result = api_instance.get_listing(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->get_listing: #{e}"
end
```

#### Using the get_listing_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Listing>, Integer, Hash)> get_listing_with_http_info(id, opts)

```ruby
begin
  # Get a listing
  data, status_code, headers = api_instance.get_listing_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Listing>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->get_listing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull listing id |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |

### Return type

[**Listing**](Listing.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_listing_publish_status

> <ListingPublishStatusResponse> get_listing_publish_status(id)

Per-channel publish status

Returns one row per platform the listing has been pushed/pulled to, with last push timestamp and any dirty fields not yet synced.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | 

begin
  # Per-channel publish status
  result = api_instance.get_listing_publish_status(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->get_listing_publish_status: #{e}"
end
```

#### Using the get_listing_publish_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPublishStatusResponse>, Integer, Hash)> get_listing_publish_status_with_http_info(id)

```ruby
begin
  # Per-channel publish status
  data, status_code, headers = api_instance.get_listing_publish_status_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPublishStatusResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->get_listing_publish_status_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**ListingPublishStatusResponse**](ListingPublishStatusResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_listings

> <ListingListResponse> list_listings(opts)

List listings

Cursor-paginated list of listings owned by the authenticated workspace. Use `pagination.nextCursor` from one response as the `cursor` query param of the next request to walk the full set. `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`. Filters: `q` (substring on name/street/city), `status`, `channel`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
opts = {
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`. Omit to fetch the first page.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.next_cursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  limit: 56, # Integer | Max items per page. Hard cap is 100.
  q: 'q_example', # String | Case-insensitive substring search on name, street, or city.
  status: 'active', # String | Filter by listing status.
  channel: 'airbnb' # String | Restrict to listings published on the given channel (`airbnb`, `booking`, `vrbo`, etc.). Joins through `listing_platform_links` and matches active links only.
}

begin
  # List listings
  result = api_instance.list_listings(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->list_listings: #{e}"
end
```

#### Using the list_listings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingListResponse>, Integer, Hash)> list_listings_with_http_info(opts)

```ruby
begin
  # List listings
  data, status_code, headers = api_instance.list_listings_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingListResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->list_listings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.next_cursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **limit** | **Integer** | Max items per page. Hard cap is 100. | [optional][default to 20] |
| **q** | **String** | Case-insensitive substring search on name, street, or city. | [optional] |
| **status** | **String** | Filter by listing status. | [optional] |
| **channel** | **String** | Restrict to listings published on the given channel (&#x60;airbnb&#x60;, &#x60;booking&#x60;, &#x60;vrbo&#x60;, etc.). Joins through &#x60;listing_platform_links&#x60; and matches active links only. | [optional] |

### Return type

[**ListingListResponse**](ListingListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## publish_listing_to_airbnb

> <ListingPublishResponse> publish_listing_to_airbnb(id, opts)

Publish a listing to Airbnb

Push a Repull listing to Airbnb. Pass `airbnbConnectionId` to update an already-mapped Airbnb listing, or `hostId` to create a brand-new Airbnb listing under that host.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | 
opts = {
  listing_publish_airbnb_request: Repull::ListingPublishAirbnbRequest.new # ListingPublishAirbnbRequest | 
}

begin
  # Publish a listing to Airbnb
  result = api_instance.publish_listing_to_airbnb(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_airbnb: #{e}"
end
```

#### Using the publish_listing_to_airbnb_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPublishResponse>, Integer, Hash)> publish_listing_to_airbnb_with_http_info(id, opts)

```ruby
begin
  # Publish a listing to Airbnb
  data, status_code, headers = api_instance.publish_listing_to_airbnb_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPublishResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_airbnb_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **listing_publish_airbnb_request** | [**ListingPublishAirbnbRequest**](ListingPublishAirbnbRequest.md) |  | [optional] |

### Return type

[**ListingPublishResponse**](ListingPublishResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## publish_listing_to_booking

> <ListingPublishResponse> publish_listing_to_booking(id)

Publish a listing to Booking.com

Push a Repull listing to Booking.com. The listing must already be mapped to a Booking property + room (created via the Booking-claim Connect flow).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ListingsApi.new
id = 56 # Integer | 

begin
  # Publish a listing to Booking.com
  result = api_instance.publish_listing_to_booking(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_booking: #{e}"
end
```

#### Using the publish_listing_to_booking_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListingPublishResponse>, Integer, Hash)> publish_listing_to_booking_with_http_info(id)

```ruby
begin
  # Publish a listing to Booking.com
  data, status_code, headers = api_instance.publish_listing_to_booking_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListingPublishResponse>
rescue Repull::ApiError => e
  puts "Error when calling ListingsApi->publish_listing_to_booking_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**ListingPublishResponse**](ListingPublishResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

