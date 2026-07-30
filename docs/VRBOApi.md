# Repull::VRBOApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_vrbo_listings**](VRBOApi.md#list_vrbo_listings) | **GET** /v1/channels/vrbo/listings | List VRBO listings |
| [**list_vrbo_reservations**](VRBOApi.md#list_vrbo_reservations) | **GET** /v1/channels/vrbo/reservations | List VRBO reservations |


## list_vrbo_listings

> <VrboListingListResponse> list_vrbo_listings

List VRBO listings

List VRBO listings this workspace owns. VRBO is agency-model — Repull reads listings via the public iCal/HTTP feeds.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new

begin
  # List VRBO listings
  result = api_instance.list_vrbo_listings
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->list_vrbo_listings: #{e}"
end
```

#### Using the list_vrbo_listings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VrboListingListResponse>, Integer, Hash)> list_vrbo_listings_with_http_info

```ruby
begin
  # List VRBO listings
  data, status_code, headers = api_instance.list_vrbo_listings_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VrboListingListResponse>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->list_vrbo_listings_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**VrboListingListResponse**](VrboListingListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_vrbo_reservations

> <VrboReservationListResponse> list_vrbo_reservations(opts)

List VRBO reservations

Cursor-paginated list of VRBO reservations sourced from the public booking feed. Lag is typically 5-10 minutes vs. Airbnb / Booking.com. `?offset=` is accepted as a first-class alias for `?cursor=` (mutually exclusive; offset capped at 10000).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::VRBOApi.new
opts = {
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.next_cursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  limit: 56, # Integer | 
  include_total: true # Boolean | When `true` (default), the response's `pagination.total` carries the count of rows matching the current filter, across all pages. Pass `false` to skip the count for very large workspaces where the per-page COUNT(*) cost matters.
}

begin
  # List VRBO reservations
  result = api_instance.list_vrbo_reservations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->list_vrbo_reservations: #{e}"
end
```

#### Using the list_vrbo_reservations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VrboReservationListResponse>, Integer, Hash)> list_vrbo_reservations_with_http_info(opts)

```ruby
begin
  # List VRBO reservations
  data, status_code, headers = api_instance.list_vrbo_reservations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VrboReservationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->list_vrbo_reservations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.next_cursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **limit** | **Integer** |  | [optional][default to 50] |
| **include_total** | **Boolean** | When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. | [optional][default to true] |

### Return type

[**VrboReservationListResponse**](VrboReservationListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

