# Repull::PlumguideApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_channels_plumguide_availability_get**](PlumguideApi.md#v1_channels_plumguide_availability_get) | **GET** /v1/channels/plumguide/availability | Get Plumguide availability |
| [**v1_channels_plumguide_availability_put**](PlumguideApi.md#v1_channels_plumguide_availability_put) | **PUT** /v1/channels/plumguide/availability | Push availability to Plumguide |
| [**v1_channels_plumguide_listings_get**](PlumguideApi.md#v1_channels_plumguide_listings_get) | **GET** /v1/channels/plumguide/listings | List Plumguide listings |
| [**v1_channels_plumguide_pricing_get**](PlumguideApi.md#v1_channels_plumguide_pricing_get) | **GET** /v1/channels/plumguide/pricing | Get Plumguide pricing |
| [**v1_channels_plumguide_pricing_put**](PlumguideApi.md#v1_channels_plumguide_pricing_put) | **PUT** /v1/channels/plumguide/pricing | Push pricing to Plumguide |


## v1_channels_plumguide_availability_get

> v1_channels_plumguide_availability_get

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
  api_instance.v1_channels_plumguide_availability_get
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->v1_channels_plumguide_availability_get: #{e}"
end
```

#### Using the v1_channels_plumguide_availability_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_plumguide_availability_get_with_http_info

```ruby
begin
  # Get Plumguide availability
  data, status_code, headers = api_instance.v1_channels_plumguide_availability_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->v1_channels_plumguide_availability_get_with_http_info: #{e}"
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


## v1_channels_plumguide_availability_put

> v1_channels_plumguide_availability_put

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
  api_instance.v1_channels_plumguide_availability_put
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->v1_channels_plumguide_availability_put: #{e}"
end
```

#### Using the v1_channels_plumguide_availability_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_plumguide_availability_put_with_http_info

```ruby
begin
  # Push availability to Plumguide
  data, status_code, headers = api_instance.v1_channels_plumguide_availability_put_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->v1_channels_plumguide_availability_put_with_http_info: #{e}"
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


## v1_channels_plumguide_listings_get

> v1_channels_plumguide_listings_get

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
  api_instance.v1_channels_plumguide_listings_get
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->v1_channels_plumguide_listings_get: #{e}"
end
```

#### Using the v1_channels_plumguide_listings_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_plumguide_listings_get_with_http_info

```ruby
begin
  # List Plumguide listings
  data, status_code, headers = api_instance.v1_channels_plumguide_listings_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->v1_channels_plumguide_listings_get_with_http_info: #{e}"
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


## v1_channels_plumguide_pricing_get

> v1_channels_plumguide_pricing_get

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
  api_instance.v1_channels_plumguide_pricing_get
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->v1_channels_plumguide_pricing_get: #{e}"
end
```

#### Using the v1_channels_plumguide_pricing_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_plumguide_pricing_get_with_http_info

```ruby
begin
  # Get Plumguide pricing
  data, status_code, headers = api_instance.v1_channels_plumguide_pricing_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->v1_channels_plumguide_pricing_get_with_http_info: #{e}"
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


## v1_channels_plumguide_pricing_put

> v1_channels_plumguide_pricing_put

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
  api_instance.v1_channels_plumguide_pricing_put
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->v1_channels_plumguide_pricing_put: #{e}"
end
```

#### Using the v1_channels_plumguide_pricing_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_plumguide_pricing_put_with_http_info

```ruby
begin
  # Push pricing to Plumguide
  data, status_code, headers = api_instance.v1_channels_plumguide_pricing_put_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling PlumguideApi->v1_channels_plumguide_pricing_put_with_http_info: #{e}"
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

