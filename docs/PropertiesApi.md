# Repull::PropertiesApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_properties_get**](PropertiesApi.md#v1_properties_get) | **GET** /v1/properties | List properties |
| [**v1_properties_id_get**](PropertiesApi.md#v1_properties_id_get) | **GET** /v1/properties/{id} | Get property details |


## v1_properties_get

> <V1PropertiesGet200Response> v1_properties_get(opts)

List properties

Returns all properties across connected PMS platforms. Supports pagination and filtering by provider.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PropertiesApi.new
opts = {
  limit: 56, # Integer | Max items per page
  offset: 56, # Integer | Pagination offset
  provider: 'provider_example' # String | Filter by PMS provider
}

begin
  # List properties
  result = api_instance.v1_properties_get(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->v1_properties_get: #{e}"
end
```

#### Using the v1_properties_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<V1PropertiesGet200Response>, Integer, Hash)> v1_properties_get_with_http_info(opts)

```ruby
begin
  # List properties
  data, status_code, headers = api_instance.v1_properties_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <V1PropertiesGet200Response>
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->v1_properties_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | Max items per page | [optional][default to 25] |
| **offset** | **Integer** | Pagination offset | [optional][default to 0] |
| **provider** | **String** | Filter by PMS provider | [optional] |

### Return type

[**V1PropertiesGet200Response**](V1PropertiesGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## v1_properties_id_get

> <Property> v1_properties_id_get(id)

Get property details

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::PropertiesApi.new
id = 56 # Integer | 

begin
  # Get property details
  result = api_instance.v1_properties_id_get(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->v1_properties_id_get: #{e}"
end
```

#### Using the v1_properties_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Property>, Integer, Hash)> v1_properties_id_get_with_http_info(id)

```ruby
begin
  # Get property details
  data, status_code, headers = api_instance.v1_properties_id_get_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Property>
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->v1_properties_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**Property**](Property.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

