# Repull::SystemApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_health_get**](SystemApi.md#v1_health_get) | **GET** /v1/health | Health check |


## v1_health_get

> <V1HealthGet200Response> v1_health_get

Health check

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::SystemApi.new

begin
  # Health check
  result = api_instance.v1_health_get
  p result
rescue Repull::ApiError => e
  puts "Error when calling SystemApi->v1_health_get: #{e}"
end
```

#### Using the v1_health_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<V1HealthGet200Response>, Integer, Hash)> v1_health_get_with_http_info

```ruby
begin
  # Health check
  data, status_code, headers = api_instance.v1_health_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <V1HealthGet200Response>
rescue Repull::ApiError => e
  puts "Error when calling SystemApi->v1_health_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**V1HealthGet200Response**](V1HealthGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

