# Repull::AvailabilityApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_availability_property_id_get**](AvailabilityApi.md#v1_availability_property_id_get) | **GET** /v1/availability/{propertyId} | Get availability calendar |
| [**v1_availability_property_id_put**](AvailabilityApi.md#v1_availability_property_id_put) | **PUT** /v1/availability/{propertyId} | Update availability |


## v1_availability_property_id_get

> <V1AvailabilityPropertyIdGet200Response> v1_availability_property_id_get(property_id, start_date, end_date)

Get availability calendar

Returns day-by-day availability, pricing, and minimum stay for a property.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AvailabilityApi.new
property_id = 56 # Integer | 
start_date = Date.parse('2013-10-20') # Date | 
end_date = Date.parse('2013-10-20') # Date | 

begin
  # Get availability calendar
  result = api_instance.v1_availability_property_id_get(property_id, start_date, end_date)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->v1_availability_property_id_get: #{e}"
end
```

#### Using the v1_availability_property_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<V1AvailabilityPropertyIdGet200Response>, Integer, Hash)> v1_availability_property_id_get_with_http_info(property_id, start_date, end_date)

```ruby
begin
  # Get availability calendar
  data, status_code, headers = api_instance.v1_availability_property_id_get_with_http_info(property_id, start_date, end_date)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <V1AvailabilityPropertyIdGet200Response>
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->v1_availability_property_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **Integer** |  |  |
| **start_date** | **Date** |  |  |
| **end_date** | **Date** |  |  |

### Return type

[**V1AvailabilityPropertyIdGet200Response**](V1AvailabilityPropertyIdGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## v1_availability_property_id_put

> v1_availability_property_id_put(property_id, opts)

Update availability

Update pricing, availability, and minimum stay for specific dates.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AvailabilityApi.new
property_id = 56 # Integer | 
opts = {
  v1_availability_property_id_put_request: Repull::V1AvailabilityPropertyIdPutRequest.new # V1AvailabilityPropertyIdPutRequest | 
}

begin
  # Update availability
  api_instance.v1_availability_property_id_put(property_id, opts)
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->v1_availability_property_id_put: #{e}"
end
```

#### Using the v1_availability_property_id_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_availability_property_id_put_with_http_info(property_id, opts)

```ruby
begin
  # Update availability
  data, status_code, headers = api_instance.v1_availability_property_id_put_with_http_info(property_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->v1_availability_property_id_put_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **Integer** |  |  |
| **v1_availability_property_id_put_request** | [**V1AvailabilityPropertyIdPutRequest**](V1AvailabilityPropertyIdPutRequest.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

