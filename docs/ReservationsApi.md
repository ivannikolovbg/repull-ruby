# Repull::ReservationsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**cancel_reservation**](ReservationsApi.md#cancel_reservation) | **DELETE** /v1/reservations/{id} | Cancel reservation |
| [**create_reservation**](ReservationsApi.md#create_reservation) | **POST** /v1/reservations | Create a reservation |
| [**get_reservation**](ReservationsApi.md#get_reservation) | **GET** /v1/reservations/{id} | Get reservation details |
| [**list_reservations**](ReservationsApi.md#list_reservations) | **GET** /v1/reservations | List reservations |
| [**update_reservation**](ReservationsApi.md#update_reservation) | **PATCH** /v1/reservations/{id} | Update reservation |


## cancel_reservation

> cancel_reservation(id)

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
  api_instance.cancel_reservation(id)
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->cancel_reservation: #{e}"
end
```

#### Using the cancel_reservation_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> cancel_reservation_with_http_info(id)

```ruby
begin
  # Cancel reservation
  data, status_code, headers = api_instance.cancel_reservation_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->cancel_reservation_with_http_info: #{e}"
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


## create_reservation

> <Reservation> create_reservation(create_reservation_request)

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
create_reservation_request = Repull::CreateReservationRequest.new({property_id: 37, check_in: Date.today, check_out: Date.today, guest_first_name: 'guest_first_name_example', guest_last_name: 'guest_last_name_example'}) # CreateReservationRequest | 

begin
  # Create a reservation
  result = api_instance.create_reservation(create_reservation_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->create_reservation: #{e}"
end
```

#### Using the create_reservation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Reservation>, Integer, Hash)> create_reservation_with_http_info(create_reservation_request)

```ruby
begin
  # Create a reservation
  data, status_code, headers = api_instance.create_reservation_with_http_info(create_reservation_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Reservation>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->create_reservation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_reservation_request** | [**CreateReservationRequest**](CreateReservationRequest.md) |  |  |

### Return type

[**Reservation**](Reservation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_reservation

> <Reservation> get_reservation(id, opts)

Get reservation details

Returns the full record for a single reservation, scoped to the authenticated workspace. Response shape is identical to a single row in `GET /v1/reservations` so SDK consumers can use the same type for both. Returns **404** if the id does not exist OR belongs to a different workspace — the API never differentiates the two so caller can't enumerate other workspaces' ids.

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
id = 56 # Integer | Internal Repull reservation ID.
opts = {
  x_schema: 'my-app-schema' # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
}

begin
  # Get reservation details
  result = api_instance.get_reservation(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->get_reservation: #{e}"
end
```

#### Using the get_reservation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Reservation>, Integer, Hash)> get_reservation_with_http_info(id, opts)

```ruby
begin
  # Get reservation details
  data, status_code, headers = api_instance.get_reservation_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Reservation>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->get_reservation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull reservation ID. |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |

### Return type

[**Reservation**](Reservation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_reservations

> <ReservationListResponse> list_reservations(opts)

List reservations

Cursor-paginated list of reservations across all connected PMS platforms. Filter by platform, status, listing, or check-in date range.  **Pagination:** Walk pages with `?cursor=` — pass `pagination.next_cursor` from one response back as `?cursor=` on the next request. Stop when `pagination.has_more` is `false`. `limit` defaults to 50, max 100; requesting more returns 422 (no silent truncation).  **Deprecation:** The `?offset=` query param is supported for backward compatibility but is deprecated and will be removed after the `Sunset` header date. Responses to offset requests carry a `Deprecation: true` header. Migrate to `?cursor=`.

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
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  limit: 56, # Integer | Page size (max 100). Requests over the cap return 422.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.next_cursor`. Omit to fetch the first page.
  offset: 56, # Integer | Deprecated — use `cursor` instead. Will be removed after the `Sunset` response header date.
  platform: 'platform_example', # String | Filter by booking platform
  status: 'confirmed', # String | 
  listing_id: 56, # Integer | Filter to a single listing
  check_in_after: Date.parse('2013-10-20'), # Date | Check-in date >= this value
  check_in_before: Date.parse('2013-10-20'), # Date | Check-in date <= this value
  check_in_from: Date.parse('2013-10-20'), # Date | Deprecated alias for `check_in_after`.
  check_in_to: Date.parse('2013-10-20') # Date | Deprecated alias for `check_in_before`.
}

begin
  # List reservations
  result = api_instance.list_reservations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->list_reservations: #{e}"
end
```

#### Using the list_reservations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReservationListResponse>, Integer, Hash)> list_reservations_with_http_info(opts)

```ruby
begin
  # List reservations
  data, status_code, headers = api_instance.list_reservations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReservationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->list_reservations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **limit** | **Integer** | Page size (max 100). Requests over the cap return 422. | [optional][default to 50] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.next_cursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | Deprecated — use &#x60;cursor&#x60; instead. Will be removed after the &#x60;Sunset&#x60; response header date. | [optional] |
| **platform** | **String** | Filter by booking platform | [optional] |
| **status** | **String** |  | [optional] |
| **listing_id** | **Integer** | Filter to a single listing | [optional] |
| **check_in_after** | **Date** | Check-in date &gt;&#x3D; this value | [optional] |
| **check_in_before** | **Date** | Check-in date &lt;&#x3D; this value | [optional] |
| **check_in_from** | **Date** | Deprecated alias for &#x60;check_in_after&#x60;. | [optional] |
| **check_in_to** | **Date** | Deprecated alias for &#x60;check_in_before&#x60;. | [optional] |

### Return type

[**ReservationListResponse**](ReservationListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_reservation

> update_reservation(id, opts)

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
  update_reservation_request: Repull::UpdateReservationRequest.new # UpdateReservationRequest | 
}

begin
  # Update reservation
  api_instance.update_reservation(id, opts)
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->update_reservation: #{e}"
end
```

#### Using the update_reservation_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_reservation_with_http_info(id, opts)

```ruby
begin
  # Update reservation
  data, status_code, headers = api_instance.update_reservation_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling ReservationsApi->update_reservation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **update_reservation_request** | [**UpdateReservationRequest**](UpdateReservationRequest.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

