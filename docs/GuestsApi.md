# Repull::GuestsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_guest**](GuestsApi.md#get_guest) | **GET** /v1/guests/{id} | Get guest profile |
| [**list_guests**](GuestsApi.md#list_guests) | **GET** /v1/guests | List guests |


## get_guest

> <GuestProfile> get_guest(id, opts)

Get guest profile

Returns the full guest profile — base list-row fields plus contacts, flags, notes, risk metadata, and reservation aggregates. Aggregates main vanio's `GuestService.getGuestProfile()` into the public Repull shape so SDK consumers don't have to learn the internal schema.

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
opts = {
  x_schema: 'my-app-schema' # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
}

begin
  # Get guest profile
  result = api_instance.get_guest(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling GuestsApi->get_guest: #{e}"
end
```

#### Using the get_guest_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GuestProfile>, Integer, Hash)> get_guest_with_http_info(id, opts)

```ruby
begin
  # Get guest profile
  data, status_code, headers = api_instance.get_guest_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GuestProfile>
rescue Repull::ApiError => e
  puts "Error when calling GuestsApi->get_guest_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |

### Return type

[**GuestProfile**](GuestProfile.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_guests

> <GuestListResponse> list_guests(opts)

List guests

Cursor-paginated list of guests in the workspace. Walks `guests.id ASC` keyset for constant per-page cost regardless of how many guests the customer has. Use `pagination.nextCursor` from one response as the `cursor` query param of the next request.  Filters: `q` (substring on name/email/phone), `has_reservation` (`true`|`false`), `listing_id` (restrict to guests with at least one reservation on that listing).

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
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`. Omit to fetch the first page.
  limit: 56, # Integer | Max items per page. Hard cap is 100.
  q: 'q_example', # String | Case-insensitive substring search on name, email, or phone.
  has_reservation: true, # Boolean | Restrict to guests that do (`true`) or do not (`false`) have any reservation on file.
  listing_id: 56 # Integer | Restrict to guests with at least one reservation on the given internal Repull listing id.
}

begin
  # List guests
  result = api_instance.list_guests(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling GuestsApi->list_guests: #{e}"
end
```

#### Using the list_guests_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GuestListResponse>, Integer, Hash)> list_guests_with_http_info(opts)

```ruby
begin
  # List guests
  data, status_code, headers = api_instance.list_guests_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GuestListResponse>
rescue Repull::ApiError => e
  puts "Error when calling GuestsApi->list_guests_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page. | [optional] |
| **limit** | **Integer** | Max items per page. Hard cap is 100. | [optional][default to 20] |
| **q** | **String** | Case-insensitive substring search on name, email, or phone. | [optional] |
| **has_reservation** | **Boolean** | Restrict to guests that do (&#x60;true&#x60;) or do not (&#x60;false&#x60;) have any reservation on file. | [optional] |
| **listing_id** | **Integer** | Restrict to guests with at least one reservation on the given internal Repull listing id. | [optional] |

### Return type

[**GuestListResponse**](GuestListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

