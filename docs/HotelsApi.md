# Repull::HotelsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_hotel**](HotelsApi.md#get_hotel) | **GET** /v1/hotels/{id} | Get a hotel |
| [**list_hotels**](HotelsApi.md#list_hotels) | **GET** /v1/hotels | List hotels |


## get_hotel

> <GetHotel200Response> get_hotel(id)

Get a hotel

One hotel with its room types. `id` is from `GET /v1/hotels`, or a listing's `hotel.id`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::HotelsApi.new
id = 'booking:255832' # String | 

begin
  # Get a hotel
  result = api_instance.get_hotel(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling HotelsApi->get_hotel: #{e}"
end
```

#### Using the get_hotel_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetHotel200Response>, Integer, Hash)> get_hotel_with_http_info(id)

```ruby
begin
  # Get a hotel
  data, status_code, headers = api_instance.get_hotel_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetHotel200Response>
rescue Repull::ApiError => e
  puts "Error when calling HotelsApi->get_hotel_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**GetHotel200Response**](GetHotel200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_hotels

> <ListHotels200Response> list_hotels

List hotels

Your workspace's hotels: hotels from a hotel PMS (Cloudbeds, Mews) and Booking.com properties with several room types or rooms. Each room type is a listing — `GET /v1/hotels/{id}` lists them with their room counts. A hotel itself is never booked: availability, prices and reservations live on its room types. See the Hotels & multi-unit guide.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::HotelsApi.new

begin
  # List hotels
  result = api_instance.list_hotels
  p result
rescue Repull::ApiError => e
  puts "Error when calling HotelsApi->list_hotels: #{e}"
end
```

#### Using the list_hotels_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListHotels200Response>, Integer, Hash)> list_hotels_with_http_info

```ruby
begin
  # List hotels
  data, status_code, headers = api_instance.list_hotels_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListHotels200Response>
rescue Repull::ApiError => e
  puts "Error when calling HotelsApi->list_hotels_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListHotels200Response**](ListHotels200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

