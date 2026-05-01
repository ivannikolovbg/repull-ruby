# Repull::ReservationsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_reservations_get**](ReservationsApi.md#v1_reservations_get) | **GET** /v1/reservations | List reservations |
| [**v1_reservations_id_delete**](ReservationsApi.md#v1_reservations_id_delete) | **DELETE** /v1/reservations/{id} | Cancel reservation |
| [**v1_reservations_id_get**](ReservationsApi.md#v1_reservations_id_get) | **GET** /v1/reservations/{id} | Get reservation details |
| [**v1_reservations_id_patch**](ReservationsApi.md#v1_reservations_id_patch) | **PATCH** /v1/reservations/{id} | Update reservation |
| [**v1_reservations_post**](ReservationsApi.md#v1_reservations_post) | **POST** /v1/reservations | Create a reservation |


## v1_reservations_get

> <V1ReservationsGet200Response> v1_reservations_get(opts)

List reservations

Returns reservations across all connected PMS platforms. Filter by platform, status, date range.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
opts = {
  limit: 56, # Integer | Max items per page
  offset: 56, # Integer | Pagination offset
  platform: 'platform_example', # String | Filter by booking platform
  status: 'confirmed', # String | 
  check_in_from: Date.parse('2013-10-20'), # Date | Check-in date range start
  check_in_to: Date.parse('2013-10-20') # Date | Check-in date range end
}

begin
  # List reservations
  result = api_instance.v1_reservations_get(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->v1_reservations_get: #{e}"
end
```

#### Using the v1_reservations_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<V1ReservationsGet200Response>, Integer, Hash)> v1_reservations_get_with_http_info(opts)

```ruby
begin
  # List reservations
  data, status_code, headers = api_instance.v1_reservations_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <V1ReservationsGet200Response>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->v1_reservations_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | Max items per page | [optional][default to 25] |
| **offset** | **Integer** | Pagination offset | [optional][default to 0] |
| **platform** | **String** | Filter by booking platform | [optional] |
| **status** | **String** |  | [optional] |
| **check_in_from** | **Date** | Check-in date range start | [optional] |
| **check_in_to** | **Date** | Check-in date range end | [optional] |

### Return type

[**V1ReservationsGet200Response**](V1ReservationsGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## v1_reservations_id_delete

> v1_reservations_id_delete(id)

Cancel reservation

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
id = 56 # Integer | 

begin
  # Cancel reservation
  api_instance.v1_reservations_id_delete(id)
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->v1_reservations_id_delete: #{e}"
end
```

#### Using the v1_reservations_id_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_reservations_id_delete_with_http_info(id)

```ruby
begin
  # Cancel reservation
  data, status_code, headers = api_instance.v1_reservations_id_delete_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->v1_reservations_id_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## v1_reservations_id_get

> <Reservation> v1_reservations_id_get(id)

Get reservation details

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
id = 56 # Integer | 

begin
  # Get reservation details
  result = api_instance.v1_reservations_id_get(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->v1_reservations_id_get: #{e}"
end
```

#### Using the v1_reservations_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Reservation>, Integer, Hash)> v1_reservations_id_get_with_http_info(id)

```ruby
begin
  # Get reservation details
  data, status_code, headers = api_instance.v1_reservations_id_get_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Reservation>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->v1_reservations_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**Reservation**](Reservation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## v1_reservations_id_patch

> v1_reservations_id_patch(id, opts)

Update reservation

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
id = 56 # Integer | 
opts = {
  v1_reservations_id_patch_request: Repull::V1ReservationsIdPatchRequest.new # V1ReservationsIdPatchRequest | 
}

begin
  # Update reservation
  api_instance.v1_reservations_id_patch(id, opts)
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->v1_reservations_id_patch: #{e}"
end
```

#### Using the v1_reservations_id_patch_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_reservations_id_patch_with_http_info(id, opts)

```ruby
begin
  # Update reservation
  data, status_code, headers = api_instance.v1_reservations_id_patch_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->v1_reservations_id_patch_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **v1_reservations_id_patch_request** | [**V1ReservationsIdPatchRequest**](V1ReservationsIdPatchRequest.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## v1_reservations_post

> <Reservation> v1_reservations_post(v1_reservations_post_request)

Create a reservation

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReservationsApi.new
v1_reservations_post_request = Repull::V1ReservationsPostRequest.new({property_id: 37, check_in: Date.today, check_out: Date.today, guest_first_name: 'guest_first_name_example', guest_last_name: 'guest_last_name_example'}) # V1ReservationsPostRequest | 

begin
  # Create a reservation
  result = api_instance.v1_reservations_post(v1_reservations_post_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->v1_reservations_post: #{e}"
end
```

#### Using the v1_reservations_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Reservation>, Integer, Hash)> v1_reservations_post_with_http_info(v1_reservations_post_request)

```ruby
begin
  # Create a reservation
  data, status_code, headers = api_instance.v1_reservations_post_with_http_info(v1_reservations_post_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Reservation>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->v1_reservations_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **v1_reservations_post_request** | [**V1ReservationsPostRequest**](V1ReservationsPostRequest.md) |  |  |

### Return type

[**Reservation**](Reservation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

