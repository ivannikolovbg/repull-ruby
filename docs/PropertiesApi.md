# Repull::PropertiesApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_property**](PropertiesApi.md#get_property) | **GET** /v1/properties/{id} | Get property details |
| [**list_properties**](PropertiesApi.md#list_properties) | **GET** /v1/properties | List properties |


## get_property

> <Property> get_property(id)

Get property details

Fetch a single property by Repull id. Property ids are workspace-scoped — an id from one workspace is not valid in another. 404 means the id does not exist OR belongs to a different workspace.

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

Cursor-paginated list of properties for the authenticated workspace. Walk pages with `?cursor=<pagination.nextCursor>`; stop when `pagination.hasMore` is `false`. Cursor is opaque base64 — do not parse it.  **Breaking change:** `?offset=` is no longer accepted. Requests passing it return 422 with a `did_you_mean: 'cursor'` hint.

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
  limit: 56, # Integer | Page size (max 100). Requests over the cap return 422.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`. Omit to fetch the first page.
  status: 'active', # String | Filter by status. Default returns active only; pass `all` to include inactive.
  include_total: true # Boolean | When `true` (default), the response's `pagination.total` carries the count of rows matching the current filter, across all pages. Pass `false` to skip the count for very large workspaces where the per-page COUNT(*) cost matters.
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
| **limit** | **Integer** | Page size (max 100). Requests over the cap return 422. | [optional][default to 50] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page. | [optional] |
| **status** | **String** | Filter by status. Default returns active only; pass &#x60;all&#x60; to include inactive. | [optional] |
| **include_total** | **Boolean** | When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. | [optional][default to true] |

### Return type

[**PropertyListResponse**](PropertyListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

