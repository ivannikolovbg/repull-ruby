# Repull::ConnectionsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**apply_connection_mappings**](ConnectionsApi.md#apply_connection_mappings) | **POST** /v1/connections/{id}/mappings | Map, unmap or create listings for units |
| [**auto_map_connection_units**](ConnectionsApi.md#auto_map_connection_units) | **POST** /v1/connections/{id}/mappings/automap | Auto-map units by exact name |
| [**list_connection_units**](ConnectionsApi.md#list_connection_units) | **GET** /v1/connections/{id}/units | List a connection&#39;s mappable units |
| [**search_connection_listing_options**](ConnectionsApi.md#search_connection_listing_options) | **GET** /v1/connections/{id}/listing-options | Search listings a unit can be mapped to |


## apply_connection_mappings

> <ApplyConnectionMappings200Response> apply_connection_mappings(id, apply_connection_mappings_request)

Map, unmap or create listings for units

One instruction per unit: `{unitId, listingId}` maps, `{unitId, listingId: null}` unmaps, `{unitId, create: true}` creates a listing. Answers per unit.  Vrbo: nothing is imported when the account is signed in. Applying a mapping that maps at least one unit starts the import: upcoming bookings and the last 30 days of messages first, then the whole account history. Follow it on `GET /v1/connect/vrbo-login` (`accounts[].import`).  Auth: a Repull API key, or a Connect session token (`sessionId`) while the hosted flow is mapping.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectionsApi.new
id = 'id_example' # String | Connection handle `{channel}:{externalAccountId}`, e.g. `vrbo:12` or `booking_extranet:36`.
apply_connection_mappings_request = Repull::ApplyConnectionMappingsRequest.new({mappings: [Repull::ApplyConnectionMappingsRequestMappingsInner.new({unit_id: 'unit_id_example'})]}) # ApplyConnectionMappingsRequest | 

begin
  # Map, unmap or create listings for units
  result = api_instance.apply_connection_mappings(id, apply_connection_mappings_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectionsApi->apply_connection_mappings: #{e}"
end
```

#### Using the apply_connection_mappings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ApplyConnectionMappings200Response>, Integer, Hash)> apply_connection_mappings_with_http_info(id, apply_connection_mappings_request)

```ruby
begin
  # Map, unmap or create listings for units
  data, status_code, headers = api_instance.apply_connection_mappings_with_http_info(id, apply_connection_mappings_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApplyConnectionMappings200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectionsApi->apply_connection_mappings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Connection handle &#x60;{channel}:{externalAccountId}&#x60;, e.g. &#x60;vrbo:12&#x60; or &#x60;booking_extranet:36&#x60;. |  |
| **apply_connection_mappings_request** | [**ApplyConnectionMappingsRequest**](ApplyConnectionMappingsRequest.md) |  |  |

### Return type

[**ApplyConnectionMappings200Response**](ApplyConnectionMappings200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## auto_map_connection_units

> <AutoMapConnectionUnits200Response> auto_map_connection_units(id, opts)

Auto-map units by exact name

Proposes (or with `apply: true` applies) mappings where a unit's name exactly matches one listing. Never guesses on ambiguity.  Auth: a Repull API key, or a Connect session token (`sessionId`) while the hosted flow is mapping.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectionsApi.new
id = 'id_example' # String | Connection handle `{channel}:{externalAccountId}`, e.g. `vrbo:12` or `booking_extranet:36`.
opts = {
  auto_map_connection_units_request: Repull::AutoMapConnectionUnitsRequest.new # AutoMapConnectionUnitsRequest | 
}

begin
  # Auto-map units by exact name
  result = api_instance.auto_map_connection_units(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectionsApi->auto_map_connection_units: #{e}"
end
```

#### Using the auto_map_connection_units_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AutoMapConnectionUnits200Response>, Integer, Hash)> auto_map_connection_units_with_http_info(id, opts)

```ruby
begin
  # Auto-map units by exact name
  data, status_code, headers = api_instance.auto_map_connection_units_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AutoMapConnectionUnits200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectionsApi->auto_map_connection_units_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Connection handle &#x60;{channel}:{externalAccountId}&#x60;, e.g. &#x60;vrbo:12&#x60; or &#x60;booking_extranet:36&#x60;. |  |
| **auto_map_connection_units_request** | [**AutoMapConnectionUnitsRequest**](AutoMapConnectionUnitsRequest.md) |  | [optional] |

### Return type

[**AutoMapConnectionUnits200Response**](AutoMapConnectionUnits200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## list_connection_units

> <ListConnectionUnits200Response> list_connection_units(id, opts)

List a connection's mappable units

The units of a connected account with their current listing, a safe suggestion, and the workspace's listing options. `status: ready` with no units means the account has no properties.  Auth: a Repull API key, or a Connect session token (`sessionId`) while the hosted flow is mapping.  `listing_options` carries only the listings the units already point at (mapped or suggested); `listing_options_total` says how many the workspace has. Search the rest with `GET /v1/connections/{id}/listing-options?q=`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectionsApi.new
id = 'id_example' # String | Connection handle `{channel}:{externalAccountId}`, e.g. `vrbo:12` or `booking_extranet:36`.
opts = {
  session_id: 'session_id_example' # String | The Connect session ID (capability token).
}

begin
  # List a connection's mappable units
  result = api_instance.list_connection_units(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectionsApi->list_connection_units: #{e}"
end
```

#### Using the list_connection_units_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListConnectionUnits200Response>, Integer, Hash)> list_connection_units_with_http_info(id, opts)

```ruby
begin
  # List a connection's mappable units
  data, status_code, headers = api_instance.list_connection_units_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListConnectionUnits200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectionsApi->list_connection_units_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Connection handle &#x60;{channel}:{externalAccountId}&#x60;, e.g. &#x60;vrbo:12&#x60; or &#x60;booking_extranet:36&#x60;. |  |
| **session_id** | **String** | The Connect session ID (capability token). | [optional] |

### Return type

[**ListConnectionUnits200Response**](ListConnectionUnits200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_connection_listing_options

> <SearchConnectionListingOptions200Response> search_connection_listing_options(id, opts)

Search listings a unit can be mapped to

Search the workspace's active listings by name, city or id, for a mapping picker. A workspace can hold tens of thousands of listings, so pickers search here as the user types rather than loading them all. Empty `q` returns the first `limit` listings by name.  Auth: a Repull API key, or a Connect session token (`sessionId`) while the hosted flow is mapping.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectionsApi.new
id = 'id_example' # String | Connection handle `{channel}:{externalAccountId}`.
opts = {
  q: 'q_example', # String | Text to match (name, city or listing id).
  limit: 56, # Integer | 
  session_id: 'session_id_example' # String | 
}

begin
  # Search listings a unit can be mapped to
  result = api_instance.search_connection_listing_options(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectionsApi->search_connection_listing_options: #{e}"
end
```

#### Using the search_connection_listing_options_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SearchConnectionListingOptions200Response>, Integer, Hash)> search_connection_listing_options_with_http_info(id, opts)

```ruby
begin
  # Search listings a unit can be mapped to
  data, status_code, headers = api_instance.search_connection_listing_options_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SearchConnectionListingOptions200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectionsApi->search_connection_listing_options_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Connection handle &#x60;{channel}:{externalAccountId}&#x60;. |  |
| **q** | **String** | Text to match (name, city or listing id). | [optional] |
| **limit** | **Integer** |  | [optional][default to 20] |
| **session_id** | **String** |  | [optional] |

### Return type

[**SearchConnectionListingOptions200Response**](SearchConnectionListingOptions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

