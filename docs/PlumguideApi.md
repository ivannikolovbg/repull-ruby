# Repull::PlumguideApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_plumguide_webhooks**](PlumguideApi.md#delete_plumguide_webhooks) | **DELETE** /v1/channels/plumguide/webhooks | Remove Plumguide webhook config |
| [**get_plumguide_availability**](PlumguideApi.md#get_plumguide_availability) | **GET** /v1/channels/plumguide/availability | Get Plumguide availability |
| [**get_plumguide_pricing**](PlumguideApi.md#get_plumguide_pricing) | **GET** /v1/channels/plumguide/pricing | Get Plumguide pricing |
| [**get_plumguide_webhooks**](PlumguideApi.md#get_plumguide_webhooks) | **GET** /v1/channels/plumguide/webhooks | Get Plumguide webhook config |
| [**list_plumguide_bookings**](PlumguideApi.md#list_plumguide_bookings) | **GET** /v1/channels/plumguide/bookings | List Plumguide bookings |
| [**list_plumguide_listings**](PlumguideApi.md#list_plumguide_listings) | **GET** /v1/channels/plumguide/listings | List Plumguide listings |
| [**update_plumguide_availability**](PlumguideApi.md#update_plumguide_availability) | **PUT** /v1/channels/plumguide/availability | Push availability to Plumguide |
| [**update_plumguide_pricing**](PlumguideApi.md#update_plumguide_pricing) | **PUT** /v1/channels/plumguide/pricing | Push pricing to Plumguide |
| [**update_plumguide_webhooks**](PlumguideApi.md#update_plumguide_webhooks) | **PUT** /v1/channels/plumguide/webhooks | Replace Plumguide webhook config |


## delete_plumguide_webhooks

> delete_plumguide_webhooks

Remove Plumguide webhook config

Delete the Plumguide webhook configuration for this workspace. Plumguide stops delivering webhooks until a new config is set.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PlumguideApi.new

begin
  # Remove Plumguide webhook config
  api_instance.delete_plumguide_webhooks
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->delete_plumguide_webhooks: #{e}"
end
```

#### Using the delete_plumguide_webhooks_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_plumguide_webhooks_with_http_info

```ruby
begin
  # Remove Plumguide webhook config
  data, status_code, headers = api_instance.delete_plumguide_webhooks_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->delete_plumguide_webhooks_with_http_info: #{e}"
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
- **Accept**: application/json


## get_plumguide_availability

> get_plumguide_availability

Get Plumguide availability

Read the per-day availability calendar for a Plumguide listing. Returns the same row shape as Airbnb availability for SDK convenience.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PlumguideApi.new

begin
  # Get Plumguide availability
  api_instance.get_plumguide_availability
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->get_plumguide_availability: #{e}"
end
```

#### Using the get_plumguide_availability_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_plumguide_availability_with_http_info

```ruby
begin
  # Get Plumguide availability
  data, status_code, headers = api_instance.get_plumguide_availability_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->get_plumguide_availability_with_http_info: #{e}"
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


## get_plumguide_pricing

> get_plumguide_pricing

Get Plumguide pricing

Read the current pricing for a Plumguide listing (base price, currency, weekend uplift).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PlumguideApi.new

begin
  # Get Plumguide pricing
  api_instance.get_plumguide_pricing
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->get_plumguide_pricing: #{e}"
end
```

#### Using the get_plumguide_pricing_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_plumguide_pricing_with_http_info

```ruby
begin
  # Get Plumguide pricing
  data, status_code, headers = api_instance.get_plumguide_pricing_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->get_plumguide_pricing_with_http_info: #{e}"
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


## get_plumguide_webhooks

> get_plumguide_webhooks

Get Plumguide webhook config

Read the current Plumguide webhook configuration for this workspace.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PlumguideApi.new

begin
  # Get Plumguide webhook config
  api_instance.get_plumguide_webhooks
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->get_plumguide_webhooks: #{e}"
end
```

#### Using the get_plumguide_webhooks_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_plumguide_webhooks_with_http_info

```ruby
begin
  # Get Plumguide webhook config
  data, status_code, headers = api_instance.get_plumguide_webhooks_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->get_plumguide_webhooks_with_http_info: #{e}"
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
- **Accept**: application/json


## list_plumguide_bookings

> list_plumguide_bookings(opts)

List Plumguide bookings

List Plumguide bookings. Default returns all bookings; pass `listing_id` to filter to one listing, or `booking_code` to fetch a single booking.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PlumguideApi.new
opts = {
  listing_id: 56, # Integer | Filter to a single Plumguide listing.
  booking_code: 'booking_code_example' # String | Fetch a single booking by its Plumguide booking code.
}

begin
  # List Plumguide bookings
  api_instance.list_plumguide_bookings(opts)
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->list_plumguide_bookings: #{e}"
end
```

#### Using the list_plumguide_bookings_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> list_plumguide_bookings_with_http_info(opts)

```ruby
begin
  # List Plumguide bookings
  data, status_code, headers = api_instance.list_plumguide_bookings_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->list_plumguide_bookings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** | Filter to a single Plumguide listing. | [optional] |
| **booking_code** | **String** | Fetch a single booking by its Plumguide booking code. | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_plumguide_listings

> <PlumguideListingListResponse> list_plumguide_listings

List Plumguide listings

List Plumguide listings this workspace has access to. Plumguide is approval-based — listings appear once Plumguide has accepted them.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PlumguideApi.new

begin
  # List Plumguide listings
  result = api_instance.list_plumguide_listings
  p result
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->list_plumguide_listings: #{e}"
end
```

#### Using the list_plumguide_listings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PlumguideListingListResponse>, Integer, Hash)> list_plumguide_listings_with_http_info

```ruby
begin
  # List Plumguide listings
  data, status_code, headers = api_instance.list_plumguide_listings_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PlumguideListingListResponse>
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->list_plumguide_listings_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**PlumguideListingListResponse**](PlumguideListingListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_plumguide_availability

> update_plumguide_availability

Push availability to Plumguide

Push per-day availability changes to Plumguide. Plumguide accepts only the next 24 months — dates beyond that are silently ignored.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PlumguideApi.new

begin
  # Push availability to Plumguide
  api_instance.update_plumguide_availability
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->update_plumguide_availability: #{e}"
end
```

#### Using the update_plumguide_availability_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_plumguide_availability_with_http_info

```ruby
begin
  # Push availability to Plumguide
  data, status_code, headers = api_instance.update_plumguide_availability_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->update_plumguide_availability_with_http_info: #{e}"
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


## update_plumguide_pricing

> update_plumguide_pricing

Push pricing to Plumguide

Push pricing changes to Plumguide. Plumguide rounds all prices to whole units of the listing currency — sub-unit precision is silently truncated.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PlumguideApi.new

begin
  # Push pricing to Plumguide
  api_instance.update_plumguide_pricing
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->update_plumguide_pricing: #{e}"
end
```

#### Using the update_plumguide_pricing_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_plumguide_pricing_with_http_info

```ruby
begin
  # Push pricing to Plumguide
  data, status_code, headers = api_instance.update_plumguide_pricing_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->update_plumguide_pricing_with_http_info: #{e}"
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


## update_plumguide_webhooks

> update_plumguide_webhooks(request_body)

Replace Plumguide webhook config

Replace the Plumguide webhook configuration. The body carries the full webhook config payload — this is a full replacement, not a patch.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PlumguideApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Replace Plumguide webhook config
  api_instance.update_plumguide_webhooks(request_body)
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->update_plumguide_webhooks: #{e}"
end
```

#### Using the update_plumguide_webhooks_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_plumguide_webhooks_with_http_info(request_body)

```ruby
begin
  # Replace Plumguide webhook config
  data, status_code, headers = api_instance.update_plumguide_webhooks_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->update_plumguide_webhooks_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

