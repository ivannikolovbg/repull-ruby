# Repull::ResolutionsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_airbnb_resolution**](ResolutionsApi.md#get_airbnb_resolution) | **GET** /v1/channels/airbnb/resolutions/{id} | Get an Airbnb Resolution Center case |
| [**list_airbnb_resolutions**](ResolutionsApi.md#list_airbnb_resolutions) | **GET** /v1/channels/airbnb/resolutions | List Airbnb Resolution Center cases |
| [**refresh_airbnb_resolutions**](ResolutionsApi.md#refresh_airbnb_resolutions) | **POST** /v1/channels/airbnb/resolutions | Refresh Airbnb resolutions from Airbnb |


## get_airbnb_resolution

> <Resolution> get_airbnb_resolution(id, opts)

Get an Airbnb Resolution Center case

One Airbnb Resolution Center case. `{id}` is the Airbnb resolution id (the `resolutionId` from the list, also a transaction's `reference`). Read-only (see the list endpoint). The amounts moved are in the transactions ledger — join `resolutionId` to a transaction's `reference`. 404 when it isn't in this workspace (POST the list endpoint to refresh first).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ResolutionsApi.new
id = 'id_example' # String | The Airbnb resolution id.
opts = {
  x_schema: 'my-app-schema' # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
}

begin
  # Get an Airbnb Resolution Center case
  result = api_instance.get_airbnb_resolution(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ResolutionsApi->get_airbnb_resolution: #{e}"
end
```

#### Using the get_airbnb_resolution_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Resolution>, Integer, Hash)> get_airbnb_resolution_with_http_info(id, opts)

```ruby
begin
  # Get an Airbnb Resolution Center case
  data, status_code, headers = api_instance.get_airbnb_resolution_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Resolution>
rescue Repull::ApiError => e
  puts "Error when calling ResolutionsApi->get_airbnb_resolution_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The Airbnb resolution id. |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |

### Return type

[**Resolution**](Resolution.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_airbnb_resolutions

> <ListAirbnbResolutions200Response> list_airbnb_resolutions(opts)

List Airbnb Resolution Center cases

The host's Airbnb Resolution Center cases (AirCover / damage, extra-guest, refund and change requests), open and closed. Served from the database; `POST` this path to refresh from Airbnb. READ-ONLY upstream — Airbnb's Resolutions API is read-only; a claim is created, evidence added and status changed only in Airbnb's Resolution Center UI, not via API. Use this for visibility and action tracking (`suggestedActionText`). The money a resolution moved is in the transactions ledger as `Resolution Payout` / `Resolution Adjustment` rows sharing the same reference — join on `resolutionId`. Cursor-paginated, newest first.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ResolutionsApi.new
opts = {
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  status: 'open', # String | Filter by lifecycle: `open` (still needs action) or `closed` (settled). Omit for all.
  limit: 56, # Integer | Page size (default 50, max 200).
  cursor: 'cursor_example' # String | Opaque pagination cursor from a previous `pagination.nextCursor`.
}

begin
  # List Airbnb Resolution Center cases
  result = api_instance.list_airbnb_resolutions(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ResolutionsApi->list_airbnb_resolutions: #{e}"
end
```

#### Using the list_airbnb_resolutions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAirbnbResolutions200Response>, Integer, Hash)> list_airbnb_resolutions_with_http_info(opts)

```ruby
begin
  # List Airbnb Resolution Center cases
  data, status_code, headers = api_instance.list_airbnb_resolutions_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAirbnbResolutions200Response>
rescue Repull::ApiError => e
  puts "Error when calling ResolutionsApi->list_airbnb_resolutions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **status** | **String** | Filter by lifecycle: &#x60;open&#x60; (still needs action) or &#x60;closed&#x60; (settled). Omit for all. | [optional] |
| **limit** | **Integer** | Page size (default 50, max 200). | [optional] |
| **cursor** | **String** | Opaque pagination cursor from a previous &#x60;pagination.nextCursor&#x60;. | [optional] |

### Return type

[**ListAirbnbResolutions200Response**](ListAirbnbResolutions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## refresh_airbnb_resolutions

> <RefreshAirbnbResolutions200Response> refresh_airbnb_resolutions(opts)

Refresh Airbnb resolutions from Airbnb

Pulls the latest Resolution Center cases from Airbnb (read-only) and stores them, then read with GET. Optionally scope to one `account_id` and/or `status`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ResolutionsApi.new
opts = {
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  refresh_airbnb_resolutions_request: Repull::RefreshAirbnbResolutionsRequest.new # RefreshAirbnbResolutionsRequest | 
}

begin
  # Refresh Airbnb resolutions from Airbnb
  result = api_instance.refresh_airbnb_resolutions(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ResolutionsApi->refresh_airbnb_resolutions: #{e}"
end
```

#### Using the refresh_airbnb_resolutions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RefreshAirbnbResolutions200Response>, Integer, Hash)> refresh_airbnb_resolutions_with_http_info(opts)

```ruby
begin
  # Refresh Airbnb resolutions from Airbnb
  data, status_code, headers = api_instance.refresh_airbnb_resolutions_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RefreshAirbnbResolutions200Response>
rescue Repull::ApiError => e
  puts "Error when calling ResolutionsApi->refresh_airbnb_resolutions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **refresh_airbnb_resolutions_request** | [**RefreshAirbnbResolutionsRequest**](RefreshAirbnbResolutionsRequest.md) |  | [optional] |

### Return type

[**RefreshAirbnbResolutions200Response**](RefreshAirbnbResolutions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

