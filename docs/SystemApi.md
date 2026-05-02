# Repull::SystemApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_health**](SystemApi.md#get_health) | **GET** /v1/health | Health check |


## get_health

> <GetHealth200Response> get_health

Health check

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::SystemApi.new

begin
  # Health check
  result = api_instance.get_health
  p result
rescue Repull::ApiError => e
  puts "Error when calling SystemApi->get_health: #{e}"
end
```

#### Using the get_health_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetHealth200Response>, Integer, Hash)> get_health_with_http_info

```ruby
begin
  # Health check
  data, status_code, headers = api_instance.get_health_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetHealth200Response>
rescue Repull::ApiError => e
  puts "Error when calling SystemApi->get_health_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetHealth200Response**](GetHealth200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

