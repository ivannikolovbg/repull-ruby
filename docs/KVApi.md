# Repull::KVApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**clear_kv**](KVApi.md#clear_kv) | **DELETE** /v1/kv | Clear KV entries by prefix |
| [**delete_kv**](KVApi.md#delete_kv) | **DELETE** /v1/kv/{key} | Delete a KV entry |
| [**get_kv**](KVApi.md#get_kv) | **GET** /v1/kv/{key} | Get a KV entry |
| [**list_kv**](KVApi.md#list_kv) | **GET** /v1/kv | List KV entries |
| [**set_kv**](KVApi.md#set_kv) | **PUT** /v1/kv/{key} | Set a KV entry |


## clear_kv

> <ClearKv200Response> clear_kv(prefix, opts)

Clear KV entries by prefix

Bulk-deletes every key in the project whose name starts with `prefix`. The `prefix` parameter is required — there is no \"delete every key in this project\" shortcut; pass an empty `prefix` is rejected with 422 to prevent accidental wipes. Returns the number of rows removed.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::KVApi.new
prefix = 'prefix_example' # String | Required. Keys starting with this string are deleted.
opts = {
  project_id: 'project_id_example' # String | 
}

begin
  # Clear KV entries by prefix
  result = api_instance.clear_kv(prefix, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling KVApi->clear_kv: #{e}"
end
```

#### Using the clear_kv_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ClearKv200Response>, Integer, Hash)> clear_kv_with_http_info(prefix, opts)

```ruby
begin
  # Clear KV entries by prefix
  data, status_code, headers = api_instance.clear_kv_with_http_info(prefix, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ClearKv200Response>
rescue Repull::ApiError => e
  puts "Error when calling KVApi->clear_kv_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **prefix** | **String** | Required. Keys starting with this string are deleted. |  |
| **project_id** | **String** |  | [optional][default to &#39;default&#39;] |

### Return type

[**ClearKv200Response**](ClearKv200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_kv

> <DeleteKv200Response> delete_kv(key, opts)

Delete a KV entry

Removes a single key. Returns `{ deleted: true }` if the row was present, `{ deleted: false }` if it was already absent — both are 200 (idempotent).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::KVApi.new
key = 'key_example' # String | 
opts = {
  project_id: 'project_id_example' # String | 
}

begin
  # Delete a KV entry
  result = api_instance.delete_kv(key, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling KVApi->delete_kv: #{e}"
end
```

#### Using the delete_kv_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DeleteKv200Response>, Integer, Hash)> delete_kv_with_http_info(key, opts)

```ruby
begin
  # Delete a KV entry
  data, status_code, headers = api_instance.delete_kv_with_http_info(key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeleteKv200Response>
rescue Repull::ApiError => e
  puts "Error when calling KVApi->delete_kv_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** |  |  |
| **project_id** | **String** |  | [optional][default to &#39;default&#39;] |

### Return type

[**DeleteKv200Response**](DeleteKv200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_kv

> <ListKv200ResponseDataInner> get_kv(key, opts)

Get a KV entry

Fetches a single key. Returns 404 when the key does not exist OR has expired (rows past `ttl_at` are filtered from reads). Cross-tenant lookups also return 404 — the API never reveals existence of another customer's keys.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::KVApi.new
key = 'key_example' # String | KV key. URL-encode `/`, `:`, etc. so they survive routing.
opts = {
  project_id: 'project_id_example' # String | 
}

begin
  # Get a KV entry
  result = api_instance.get_kv(key, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling KVApi->get_kv: #{e}"
end
```

#### Using the get_kv_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListKv200ResponseDataInner>, Integer, Hash)> get_kv_with_http_info(key, opts)

```ruby
begin
  # Get a KV entry
  data, status_code, headers = api_instance.get_kv_with_http_info(key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListKv200ResponseDataInner>
rescue Repull::ApiError => e
  puts "Error when calling KVApi->get_kv_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** | KV key. URL-encode &#x60;/&#x60;, &#x60;:&#x60;, etc. so they survive routing. |  |
| **project_id** | **String** |  | [optional][default to &#39;default&#39;] |

### Return type

[**ListKv200ResponseDataInner**](ListKv200ResponseDataInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_kv

> <ListKv200Response> list_kv(opts)

List KV entries

Returns every non-expired key-value row in the given project, sorted ascending by key. Use `prefix` to scope to a key namespace (e.g. `prefix=user:42:` to fetch all entries for one user). Hard cap of 1,000 rows per response — for projects approaching that, paginate by walking prefix buckets.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::KVApi.new
opts = {
  project_id: 'project_id_example', # String | Project namespace. Defaults to `default`. Free-form string the customer chooses (typically the Studio project id).
  prefix: 'prefix_example' # String | Restrict to keys starting with this string. `LIKE` wildcards (`%`, `_`) are escaped — pass them literally.
}

begin
  # List KV entries
  result = api_instance.list_kv(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling KVApi->list_kv: #{e}"
end
```

#### Using the list_kv_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListKv200Response>, Integer, Hash)> list_kv_with_http_info(opts)

```ruby
begin
  # List KV entries
  data, status_code, headers = api_instance.list_kv_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListKv200Response>
rescue Repull::ApiError => e
  puts "Error when calling KVApi->list_kv_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_id** | **String** | Project namespace. Defaults to &#x60;default&#x60;. Free-form string the customer chooses (typically the Studio project id). | [optional][default to &#39;default&#39;] |
| **prefix** | **String** | Restrict to keys starting with this string. &#x60;LIKE&#x60; wildcards (&#x60;%&#x60;, &#x60;_&#x60;) are escaped — pass them literally. | [optional] |

### Return type

[**ListKv200Response**](ListKv200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## set_kv

> <ListKv200ResponseDataInner> set_kv(key, set_kv_request, opts)

Set a KV entry

Upserts a key. The full row is replaced — there is no partial update. Pass `ttl_seconds` (positive integer) to auto-expire the row; omit for no expiry. **Caps:** 64 KiB per row (key bytes + value JSON bytes), 1 MiB per customer (sum across ALL projects/keys). Over either cap returns 413.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::KVApi.new
key = 'key_example' # String | 
set_kv_request = Repull::SetKvRequest.new({value: 3.56}) # SetKvRequest | 
opts = {
  project_id: 'project_id_example' # String | 
}

begin
  # Set a KV entry
  result = api_instance.set_kv(key, set_kv_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling KVApi->set_kv: #{e}"
end
```

#### Using the set_kv_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListKv200ResponseDataInner>, Integer, Hash)> set_kv_with_http_info(key, set_kv_request, opts)

```ruby
begin
  # Set a KV entry
  data, status_code, headers = api_instance.set_kv_with_http_info(key, set_kv_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListKv200ResponseDataInner>
rescue Repull::ApiError => e
  puts "Error when calling KVApi->set_kv_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** |  |  |
| **set_kv_request** | [**SetKvRequest**](SetKvRequest.md) |  |  |
| **project_id** | **String** |  | [optional][default to &#39;default&#39;] |

### Return type

[**ListKv200ResponseDataInner**](ListKv200ResponseDataInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

