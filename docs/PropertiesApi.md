# Repull::PropertiesApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_property**](PropertiesApi.md#get_property) | **GET** /v1/properties/{id} | Get property details |
| [**list_properties**](PropertiesApi.md#list_properties) | **GET** /v1/properties | List properties |


## get_property

> <Property> get_property(id, opts)

Get property details

Fetch a single property by Repull id. Property ids are workspace-scoped — an id from one workspace is not valid in another. 404 means the id does not exist OR belongs to a different workspace.  **Optional expansions:** Pass `?include=amenities` to enrich the response with the property's amenities (sourced from the unified `listings_amenities` table). Returns `[]` when the property has no amenity rows. The default response stays lean; consumers must opt in.

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
opts = {
  include: 'amenities' # String | Comma-separated optional expansions. Currently supported: `amenities`. Unknown values return 422.
}

begin
  # Get property details
  result = api_instance.get_property(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling PropertiesApi->get_property: #{e}"
end
```

#### Using the get_property_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Property>, Integer, Hash)> get_property_with_http_info(id, opts)

```ruby
begin
  # Get property details
  data, status_code, headers = api_instance.get_property_with_http_info(id, opts)
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
| **include** | **String** | Comma-separated optional expansions. Currently supported: &#x60;amenities&#x60;. Unknown values return 422. | [optional] |

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

Cursor-paginated list of properties for the authenticated workspace. Walk pages with `?cursor=<pagination.nextCursor>`; stop when `pagination.hasMore` is `false`. Cursor is opaque base64 — do not parse it.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`.  Filters: `q` (substring on name/street/city), `status` (active|inactive|all), `lifecycle_status` (exact match on the listing's lifecycle state). Other unknown params (e.g. `?search=` or `?propertyId=`) are rejected with 422 — no silent unfiltered results.

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
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.next_cursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  q: 'q_example', # String | Case-insensitive substring search on name, street, or city.
  status: 'active', # String | Filter by status. Default returns active only; pass `inactive` to invert or `all` to include both.
  lifecycle_status: 'live', # String | Filter by lifecycle status (e.g. `live`, `draft`, `archived`). Pass `all` to disable the filter.
  channel: 'airbnb', # String | Filter to properties with an active link on the given OTA/channel (airbnb, booking, vrbo). Omit to include every channel. Each property also returns a `channels` array listing the OTAs it is published on.
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
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.next_cursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **q** | **String** | Case-insensitive substring search on name, street, or city. | [optional] |
| **status** | **String** | Filter by status. Default returns active only; pass &#x60;inactive&#x60; to invert or &#x60;all&#x60; to include both. | [optional][default to &#39;active&#39;] |
| **lifecycle_status** | **String** | Filter by lifecycle status (e.g. &#x60;live&#x60;, &#x60;draft&#x60;, &#x60;archived&#x60;). Pass &#x60;all&#x60; to disable the filter. | [optional] |
| **channel** | **String** | Filter to properties with an active link on the given OTA/channel (airbnb, booking, vrbo). Omit to include every channel. Each property also returns a &#x60;channels&#x60; array listing the OTAs it is published on. | [optional] |
| **include_total** | **Boolean** | When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. | [optional][default to true] |

### Return type

[**PropertyListResponse**](PropertyListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

