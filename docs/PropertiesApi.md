# Repull::PropertiesApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_property**](PropertiesApi.md#get_property) | **GET** /v1/properties/{id} | Get property details |
| [**list_properties**](PropertiesApi.md#list_properties) | **GET** /v1/properties | List properties |


## get_property

> <Property> get_property(id)

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
  result = api_instance.get_property(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->get_property: #{e}"
end
```

#### Using the get_property_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Property>, Integer, Hash)> get_property_with_http_info(id)

```ruby
begin
  # Get property details
  data, status_code, headers = api_instance.get_property_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Property>
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->get_property_with_http_info: #{e}"
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


## list_properties

> <PropertyListResponse> list_properties(opts)

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
  result = api_instance.list_properties(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->list_properties: #{e}"
end
```

#### Using the list_properties_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PropertyListResponse>, Integer, Hash)> list_properties_with_http_info(opts)

```ruby
begin
  # List properties
  data, status_code, headers = api_instance.list_properties_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PropertyListResponse>
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->list_properties_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | Max items per page | [optional][default to 25] |
| **offset** | **Integer** | Pagination offset | [optional][default to 0] |
| **provider** | **String** | Filter by PMS provider | [optional] |

### Return type

[**PropertyListResponse**](PropertyListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

