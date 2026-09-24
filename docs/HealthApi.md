# Repull::HealthApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_auth_health**](HealthApi.md#get_auth_health) | **GET** /v1/health/auth | API-key authentication path health |
| [**get_channel_health**](HealthApi.md#get_channel_health) | **GET** /v1/health/channels/{channel} | Per-channel connectivity health |
| [**get_mcp_health**](HealthApi.md#get_mcp_health) | **GET** /v1/health/mcp | MCP server reachability |
| [**get_webhooks_health**](HealthApi.md#get_webhooks_health) | **GET** /v1/health/webhooks | Webhook delivery pipeline health |


## get_auth_health

> Hash&lt;String, Object&gt; get_auth_health

API-key authentication path health

Component-level probe. `GET /v1/health` reports the API as a whole; this reports one dependency so an incident can be localised without guessing.

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::HealthApi.new

begin
  # API-key authentication path health
  result = api_instance.get_auth_health
  p result
rescue Repull::ApiError => e
  puts "Error when calling HealthApi->get_auth_health: #{e}"
end
```

#### Using the get_auth_health_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> get_auth_health_with_http_info

```ruby
begin
  # API-key authentication path health
  data, status_code, headers = api_instance.get_auth_health_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue Repull::ApiError => e
  puts "Error when calling HealthApi->get_auth_health_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_channel_health

> Hash&lt;String, Object&gt; get_channel_health(channel)

Per-channel connectivity health

Reports reachability and auth state for one channel (`airbnb`, `booking`, `vrbo`, `plumguide`). Use it to tell \"the channel is down\" apart from \"this workspace's connection expired\".

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::HealthApi.new
channel = 'airbnb' # String | 

begin
  # Per-channel connectivity health
  result = api_instance.get_channel_health(channel)
  p result
rescue Repull::ApiError => e
  puts "Error when calling HealthApi->get_channel_health: #{e}"
end
```

#### Using the get_channel_health_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> get_channel_health_with_http_info(channel)

```ruby
begin
  # Per-channel connectivity health
  data, status_code, headers = api_instance.get_channel_health_with_http_info(channel)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue Repull::ApiError => e
  puts "Error when calling HealthApi->get_channel_health_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  |  |

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_mcp_health

> Hash&lt;String, Object&gt; get_mcp_health

MCP server reachability

Component-level probe. `GET /v1/health` reports the API as a whole; this reports one dependency so an incident can be localised without guessing.

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::HealthApi.new

begin
  # MCP server reachability
  result = api_instance.get_mcp_health
  p result
rescue Repull::ApiError => e
  puts "Error when calling HealthApi->get_mcp_health: #{e}"
end
```

#### Using the get_mcp_health_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> get_mcp_health_with_http_info

```ruby
begin
  # MCP server reachability
  data, status_code, headers = api_instance.get_mcp_health_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue Repull::ApiError => e
  puts "Error when calling HealthApi->get_mcp_health_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_webhooks_health

> Hash&lt;String, Object&gt; get_webhooks_health

Webhook delivery pipeline health

Component-level probe. `GET /v1/health` reports the API as a whole; this reports one dependency so an incident can be localised without guessing.

### Examples

```ruby
require 'time'
require 'repull'

api_instance = Repull::HealthApi.new

begin
  # Webhook delivery pipeline health
  result = api_instance.get_webhooks_health
  p result
rescue Repull::ApiError => e
  puts "Error when calling HealthApi->get_webhooks_health: #{e}"
end
```

#### Using the get_webhooks_health_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> get_webhooks_health_with_http_info

```ruby
begin
  # Webhook delivery pipeline health
  data, status_code, headers = api_instance.get_webhooks_health_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue Repull::ApiError => e
  puts "Error when calling HealthApi->get_webhooks_health_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

