# Repull::ReviewsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_review**](ReviewsApi.md#get_review) | **GET** /v1/reviews/{id} | Get review |
| [**list_reviews**](ReviewsApi.md#list_reviews) | **GET** /v1/reviews | List reviews |


## get_review

> <ReviewGetResponse> get_review(id, opts)

Get review

Returns one review (matching the list-endpoint `Review` shape) wrapped in `{ data: Review }`. Scoped to the authenticated workspace via the listings join — reviews that don't belong to the workspace return 404 (we don't differentiate to avoid leaking other customers' ids).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReviewsApi.new
id = 56 # Integer | Internal Repull review id.
opts = {
  x_schema: 'my-app-schema' # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
}

begin
  # Get review
  result = api_instance.get_review(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->get_review: #{e}"
end
```

#### Using the get_review_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReviewGetResponse>, Integer, Hash)> get_review_with_http_info(id, opts)

```ruby
begin
  # Get review
  data, status_code, headers = api_instance.get_review_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReviewGetResponse>
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->get_review_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull review id. |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |

### Return type

[**ReviewGetResponse**](ReviewGetResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_reviews

> <ReviewListResponse> list_reviews(opts)

List reviews

Cursor-paginated guest + host review stream for the workspace. Backed by main vanio's unified `reviews` table (populated by per-channel backfill crons), so this surface returns the complete cross-channel history — separate from `/v1/channels/airbnb/reviews` which hits Airbnb live.  Filters: `platform` (`airbnb`|`booking`|`vrbo`), `listing_id` (internal Repull listing id), `rating_min` / `rating_max` (inclusive bounds, 0..5), `status` (`responded`|`unanswered`|`all`), `reviewer_role` (`guest` (default) | `host` | `all`).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReviewsApi.new
opts = {
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.next_cursor`.
  limit: 56, # Integer | 
  platform: 'airbnb', # String | 
  listing_id: 56, # Integer | Restrict to one internal Repull listing.
  rating_min: 8.14, # Float | 
  rating_max: 8.14, # Float | 
  status: 'responded', # String | `responded` — host has replied. `unanswered` — host has not replied. `all` — no filter.
  reviewer_role: 'guest' # String | `guest` (default) — reviews written by guests about the host/property. `host` — reviews written by the host about guests. `all` — both.
}

begin
  # List reviews
  result = api_instance.list_reviews(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->list_reviews: #{e}"
end
```

#### Using the list_reviews_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReviewListResponse>, Integer, Hash)> list_reviews_with_http_info(opts)

```ruby
begin
  # List reviews
  data, status_code, headers = api_instance.list_reviews_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReviewListResponse>
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->list_reviews_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.next_cursor&#x60;. | [optional] |
| **limit** | **Integer** |  | [optional][default to 20] |
| **platform** | **String** |  | [optional] |
| **listing_id** | **Integer** | Restrict to one internal Repull listing. | [optional] |
| **rating_min** | **Float** |  | [optional] |
| **rating_max** | **Float** |  | [optional] |
| **status** | **String** | &#x60;responded&#x60; — host has replied. &#x60;unanswered&#x60; — host has not replied. &#x60;all&#x60; — no filter. | [optional] |
| **reviewer_role** | **String** | &#x60;guest&#x60; (default) — reviews written by guests about the host/property. &#x60;host&#x60; — reviews written by the host about guests. &#x60;all&#x60; — both. | [optional][default to &#39;guest&#39;] |

### Return type

[**ReviewListResponse**](ReviewListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

