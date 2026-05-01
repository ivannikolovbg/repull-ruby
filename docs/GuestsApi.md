# Repull::GuestsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_guests_get**](GuestsApi.md#v1_guests_get) | **GET** /v1/guests | List guests |
| [**v1_guests_id_get**](GuestsApi.md#v1_guests_id_get) | **GET** /v1/guests/{id} | Get guest profile |


## v1_guests_get

> <V1GuestsGet200Response> v1_guests_get(opts)

List guests

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::GuestsApi.new
opts = {
  limit: 56, # Integer | Max items per page
  offset: 56, # Integer | Pagination offset
  search: 'search_example' # String | Search by name, email, or phone
}

begin
  # List guests
  result = api_instance.v1_guests_get(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling GuestsApi->v1_guests_get: #{e}"
end
```

#### Using the v1_guests_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<V1GuestsGet200Response>, Integer, Hash)> v1_guests_get_with_http_info(opts)

```ruby
begin
  # List guests
  data, status_code, headers = api_instance.v1_guests_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <V1GuestsGet200Response>
rescue Repull::ApiError => e
  puts "Error when calling GuestsApi->v1_guests_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | Max items per page | [optional][default to 25] |
| **offset** | **Integer** | Pagination offset | [optional][default to 0] |
| **search** | **String** | Search by name, email, or phone | [optional] |

### Return type

[**V1GuestsGet200Response**](V1GuestsGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## v1_guests_id_get

> <Guest> v1_guests_id_get(id)

Get guest profile

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::GuestsApi.new
id = 56 # Integer | 

begin
  # Get guest profile
  result = api_instance.v1_guests_id_get(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling GuestsApi->v1_guests_id_get: #{e}"
end
```

#### Using the v1_guests_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Guest>, Integer, Hash)> v1_guests_id_get_with_http_info(id)

```ruby
begin
  # Get guest profile
  data, status_code, headers = api_instance.v1_guests_id_get_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Guest>
rescue Repull::ApiError => e
  puts "Error when calling GuestsApi->v1_guests_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**Guest**](Guest.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

