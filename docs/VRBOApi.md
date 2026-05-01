# Repull::VRBOApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_channels_vrbo_listings_get**](VRBOApi.md#v1_channels_vrbo_listings_get) | **GET** /v1/channels/vrbo/listings | List VRBO listings |
| [**v1_channels_vrbo_reservations_get**](VRBOApi.md#v1_channels_vrbo_reservations_get) | **GET** /v1/channels/vrbo/reservations | List VRBO reservations |


## v1_channels_vrbo_listings_get

> v1_channels_vrbo_listings_get

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
  api_instance.v1_channels_vrbo_listings_get
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->v1_channels_vrbo_listings_get: #{e}"
end
```

#### Using the v1_channels_vrbo_listings_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_vrbo_listings_get_with_http_info

```ruby
begin
  # List VRBO listings
  data, status_code, headers = api_instance.v1_channels_vrbo_listings_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->v1_channels_vrbo_listings_get_with_http_info: #{e}"
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


## v1_channels_vrbo_reservations_get

> v1_channels_vrbo_reservations_get

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
  api_instance.v1_channels_vrbo_reservations_get
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->v1_channels_vrbo_reservations_get: #{e}"
end
```

#### Using the v1_channels_vrbo_reservations_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_channels_vrbo_reservations_get_with_http_info

```ruby
begin
  # List VRBO reservations
  data, status_code, headers = api_instance.v1_channels_vrbo_reservations_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling VRBOApi->v1_channels_vrbo_reservations_get_with_http_info: #{e}"
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

