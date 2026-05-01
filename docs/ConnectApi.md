# Repull::ConnectApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_connect_get**](ConnectApi.md#v1_connect_get) | **GET** /v1/connect | List PMS/OTA connections |
| [**v1_connect_provider_delete**](ConnectApi.md#v1_connect_provider_delete) | **DELETE** /v1/connect/{provider} | Disconnect provider |
| [**v1_connect_provider_get**](ConnectApi.md#v1_connect_provider_get) | **GET** /v1/connect/{provider} | Get connection status |
| [**v1_connect_provider_post**](ConnectApi.md#v1_connect_provider_post) | **POST** /v1/connect/{provider} | Connect to PMS/OTA provider |


## v1_connect_get

> <V1ConnectGet200Response> v1_connect_get

List PMS/OTA connections

Returns all active connections to PMS and OTA platforms.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new

begin
  # List PMS/OTA connections
  result = api_instance.v1_connect_get
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->v1_connect_get: #{e}"
end
```

#### Using the v1_connect_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<V1ConnectGet200Response>, Integer, Hash)> v1_connect_get_with_http_info

```ruby
begin
  # List PMS/OTA connections
  data, status_code, headers = api_instance.v1_connect_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <V1ConnectGet200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->v1_connect_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**V1ConnectGet200Response**](V1ConnectGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## v1_connect_provider_delete

> v1_connect_provider_delete(provider)

Disconnect provider

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
provider = 'provider_example' # String | PMS provider slug (e.g., hostaway, guesty, ownerrez)

begin
  # Disconnect provider
  api_instance.v1_connect_provider_delete(provider)
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->v1_connect_provider_delete: #{e}"
end
```

#### Using the v1_connect_provider_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_connect_provider_delete_with_http_info(provider)

```ruby
begin
  # Disconnect provider
  data, status_code, headers = api_instance.v1_connect_provider_delete_with_http_info(provider)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->v1_connect_provider_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** | PMS provider slug (e.g., hostaway, guesty, ownerrez) |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## v1_connect_provider_get

> <ConnectStatus> v1_connect_provider_get(provider)

Get connection status

Returns the current connection status for a provider, including host metadata (display name + avatar) for Airbnb so clients can render an account-level confirmation UI.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
provider = 'provider_example' # String | PMS provider slug (e.g., hostaway, guesty, ownerrez)

begin
  # Get connection status
  result = api_instance.v1_connect_provider_get(provider)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->v1_connect_provider_get: #{e}"
end
```

#### Using the v1_connect_provider_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConnectStatus>, Integer, Hash)> v1_connect_provider_get_with_http_info(provider)

```ruby
begin
  # Get connection status
  data, status_code, headers = api_instance.v1_connect_provider_get_with_http_info(provider)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConnectStatus>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->v1_connect_provider_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** | PMS provider slug (e.g., hostaway, guesty, ownerrez) |  |

### Return type

[**ConnectStatus**](ConnectStatus.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## v1_connect_provider_post

> <Connection> v1_connect_provider_post(provider, opts)

Connect to PMS/OTA provider

Establish a connection to a PMS or OTA platform. Credentials vary by provider — see docs for each provider.  Airbnb-specific: pass `redirectUrl` (where to send the user after consent) and optionally `accessType` (`read_only` for calendar-only OAuth scopes, or `full_access` — the default — for full host scopes). The response returns a hosted `oauthUrl` to redirect the user to.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConnectApi.new
provider = 'provider_example' # String | PMS provider slug (e.g., hostaway, guesty, ownerrez)
opts = {
  v1_connect_provider_post_request: Repull::V1ConnectProviderPostRequest.new # V1ConnectProviderPostRequest | 
}

begin
  # Connect to PMS/OTA provider
  result = api_instance.v1_connect_provider_post(provider, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->v1_connect_provider_post: #{e}"
end
```

#### Using the v1_connect_provider_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Connection>, Integer, Hash)> v1_connect_provider_post_with_http_info(provider, opts)

```ruby
begin
  # Connect to PMS/OTA provider
  data, status_code, headers = api_instance.v1_connect_provider_post_with_http_info(provider, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Connection>
rescue Repull::ApiError => e
  puts "Error when calling ConnectApi->v1_connect_provider_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** | PMS provider slug (e.g., hostaway, guesty, ownerrez) |  |
| **v1_connect_provider_post_request** | [**V1ConnectProviderPostRequest**](V1ConnectProviderPostRequest.md) |  | [optional] |

### Return type

[**Connection**](Connection.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

