# Repull::VRBOApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_vrbo_listing_pricing**](VRBOApi.md#get_vrbo_listing_pricing) | **GET** /v1/channels/vrbo/listings/{id}/pricing | Get VRBO pricing (501 — agency model) |
| [**list_vrbo_listings**](VRBOApi.md#list_vrbo_listings) | **GET** /v1/channels/vrbo/listings | List VRBO listings |
| [**list_vrbo_reservations**](VRBOApi.md#list_vrbo_reservations) | **GET** /v1/channels/vrbo/reservations | List VRBO reservations |
| [**update_vrbo_listing_pricing**](VRBOApi.md#update_vrbo_listing_pricing) | **PUT** /v1/channels/vrbo/listings/{id}/pricing | Update VRBO pricing (501 — no push API exists) |


## get_vrbo_listing_pricing

> get_vrbo_listing_pricing(id)

Get VRBO pricing (501 — agency model)

VRBO uses the agency model — VRBO PULLS rates from `/api/webhooks/vrbo/listings-xml/rates/{listing}/{unit}` rather than accepting a push API. This endpoint is declared for symmetry with the other channel-pricing routes but currently returns **501 Not Implemented** with a pointer at the public rate URL VRBO consumes. Use `GET /v1/listings/{id}/calendar` (once wired) to inspect the underlying source-of-truth.  When the listings-XML rate-builder is ported into this repo, this endpoint will return the parsed rates VRBO sees.

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
id = 56 # Integer | Vanio listing ID — resolved to a VRBO listing/unit via the workspace mapping.

begin
  # Get VRBO pricing (501 — agency model)
  api_instance.get_vrbo_listing_pricing(id)
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_pricing: #{e}"
end
```

#### Using the get_vrbo_listing_pricing_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_vrbo_listing_pricing_with_http_info(id)

```ruby
begin
  # Get VRBO pricing (501 — agency model)
  data, status_code, headers = api_instance.get_vrbo_listing_pricing_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->get_vrbo_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Vanio listing ID — resolved to a VRBO listing/unit via the workspace mapping. |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_vrbo_listings

> <VrboListingListResponse> list_vrbo_listings

List VRBO listings

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

> <VrboReservationListResponse> list_vrbo_reservations

List VRBO reservations

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
  # List VRBO reservations
  result = api_instance.list_vrbo_reservations
  p result
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->list_vrbo_reservations: #{e}"
end
```

#### Using the list_vrbo_reservations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VrboReservationListResponse>, Integer, Hash)> list_vrbo_reservations_with_http_info

```ruby
begin
  # List VRBO reservations
  data, status_code, headers = api_instance.list_vrbo_reservations_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VrboReservationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->list_vrbo_reservations_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**VrboReservationListResponse**](VrboReservationListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_vrbo_listing_pricing

> update_vrbo_listing_pricing(id)

Update VRBO pricing (501 — no push API exists)

VRBO has no rate-push API. To change what VRBO sees, update the underlying Vanio calendar/pricing-settings (e.g. `PUT /v1/listings/{id}/calendar` once wired) — VRBO will pick up the change on its next pull. This endpoint always returns **501** rather than fake-stubbing a successful push the SDK would silently swallow.

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
id = 56 # Integer | 

begin
  # Update VRBO pricing (501 — no push API exists)
  api_instance.update_vrbo_listing_pricing(id)
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_pricing: #{e}"
end
```

#### Using the update_vrbo_listing_pricing_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_vrbo_listing_pricing_with_http_info(id)

```ruby
begin
  # Update VRBO pricing (501 — no push API exists)
  data, status_code, headers = api_instance.update_vrbo_listing_pricing_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->update_vrbo_listing_pricing_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

