# Repull::AvailabilityApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_availability**](AvailabilityApi.md#get_availability) | **GET** /v1/availability/{propertyId} | Get availability calendar |
| [**update_availability**](AvailabilityApi.md#update_availability) | **PUT** /v1/availability/{propertyId} | Update availability |


## get_availability

> <CalendarResponse> get_availability(property_id, start_date, end_date)

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
  result = api_instance.get_availability(property_id, start_date, end_date)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->get_availability: #{e}"
end
```

#### Using the get_availability_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CalendarResponse>, Integer, Hash)> get_availability_with_http_info(property_id, start_date, end_date)

```ruby
begin
  # Get availability calendar
  data, status_code, headers = api_instance.get_availability_with_http_info(property_id, start_date, end_date)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CalendarResponse>
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->get_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **Integer** |  |  |
| **start_date** | **Date** |  |  |
| **end_date** | **Date** |  |  |

### Return type

[**CalendarResponse**](CalendarResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_availability

> update_availability(property_id, opts)

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
  update_availability_request: Repull::UpdateAvailabilityRequest.new # UpdateAvailabilityRequest | 
}

begin
  # Update availability
  api_instance.update_availability(property_id, opts)
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->update_availability: #{e}"
end
```

#### Using the update_availability_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_availability_with_http_info(property_id, opts)

```ruby
begin
  # Update availability
  data, status_code, headers = api_instance.update_availability_with_http_info(property_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling AvailabilityApi->update_availability_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **Integer** |  |  |
| **update_availability_request** | [**UpdateAvailabilityRequest**](UpdateAvailabilityRequest.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

