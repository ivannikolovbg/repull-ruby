# Repull::PlumguideApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_plumguide_availability**](PlumguideApi.md#get_plumguide_availability) | **GET** /v1/channels/plumguide/availability | Get Plumguide availability |
| [**get_plumguide_pricing**](PlumguideApi.md#get_plumguide_pricing) | **GET** /v1/channels/plumguide/pricing | Get Plumguide pricing |
| [**list_plumguide_listings**](PlumguideApi.md#list_plumguide_listings) | **GET** /v1/channels/plumguide/listings | List Plumguide listings |
| [**update_plumguide_availability**](PlumguideApi.md#update_plumguide_availability) | **PUT** /v1/channels/plumguide/availability | Push availability to Plumguide |
| [**update_plumguide_pricing**](PlumguideApi.md#update_plumguide_pricing) | **PUT** /v1/channels/plumguide/pricing | Push pricing to Plumguide |


## get_plumguide_availability

> get_plumguide_availability

Get Plumguide availability

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


## list_plumguide_listings

> <PlumguideListingListResponse> list_plumguide_listings

List Plumguide listings

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

