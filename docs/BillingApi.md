# Repull::BillingApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_billing_checkout**](BillingApi.md#create_billing_checkout) | **POST** /v1/billing | Create checkout session |
| [**get_usage_logs**](BillingApi.md#get_usage_logs) | **GET** /v1/usage/logs | List API request logs |
| [**get_usage_summary**](BillingApi.md#get_usage_summary) | **GET** /v1/usage/summary | Get usage summary |
| [**get_usage_tier**](BillingApi.md#get_usage_tier) | **GET** /v1/usage/tier | Get tier and quota |


## create_billing_checkout

> create_billing_checkout(opts)

Create checkout session

Redirect user to Stripe checkout.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BillingApi.new
opts = {
  create_billing_checkout_request: Repull::CreateBillingCheckoutRequest.new # CreateBillingCheckoutRequest | 
}

begin
  # Create checkout session
  api_instance.create_billing_checkout(opts)
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->create_billing_checkout: #{e}"
end
```

#### Using the create_billing_checkout_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_billing_checkout_with_http_info(opts)

```ruby
begin
  # Create checkout session
  data, status_code, headers = api_instance.create_billing_checkout_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->create_billing_checkout_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_billing_checkout_request** | [**CreateBillingCheckoutRequest**](CreateBillingCheckoutRequest.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## get_usage_logs

> <GetUsageLogs200Response> get_usage_logs(opts)

List API request logs

Cursor-paginated raw API request log for the authenticated workspace, newest first. Filter by time `range`, `operation` id(s), status class, or free-text `q`. Walk pages with `cursor` from `pagination.next_cursor` until `pagination.has_more` is `false`; `offset` is accepted as a shallow alias (deep walks must use `cursor`).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BillingApi.new
opts = {
  range: '1h', # String | Time window ending now.
  operation: 'operation_example', # String | Comma-separated `operation_id` filter.
  status: '2xx', # String | Status-class filter.
  q: 'q_example', # String | Free-text match on path / operation / request id.
  limit: 56, # Integer | Page size (max 200).
  cursor: 'cursor_example', # String | Opaque cursor from the previous response's `pagination.next_cursor`.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.next_cursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  include_total: true # Boolean | When `true` (default), the response's `pagination.total` carries the count of rows matching the current filter, across all pages. Pass `false` to skip the count for very large workspaces where the per-page COUNT(*) cost matters.
}

begin
  # List API request logs
  result = api_instance.get_usage_logs(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->get_usage_logs: #{e}"
end
```

#### Using the get_usage_logs_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetUsageLogs200Response>, Integer, Hash)> get_usage_logs_with_http_info(opts)

```ruby
begin
  # List API request logs
  data, status_code, headers = api_instance.get_usage_logs_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetUsageLogs200Response>
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->get_usage_logs_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **range** | **String** | Time window ending now. | [optional][default to &#39;24h&#39;] |
| **operation** | **String** | Comma-separated &#x60;operation_id&#x60; filter. | [optional] |
| **status** | **String** | Status-class filter. | [optional] |
| **q** | **String** | Free-text match on path / operation / request id. | [optional] |
| **limit** | **Integer** | Page size (max 200). | [optional][default to 50] |
| **cursor** | **String** | Opaque cursor from the previous response&#39;s &#x60;pagination.next_cursor&#x60;. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.next_cursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **include_total** | **Boolean** | When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. | [optional][default to true] |

### Return type

[**GetUsageLogs200Response**](GetUsageLogs200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_usage_summary

> <GetUsageSummary200Response> get_usage_summary(opts)

Get usage summary

Aggregated usage over the requested `range` — tier + plan limits, quota used/remaining, next reset, a per-operation breakdown (request/error counts, error rate, avg latency), a daily timeline, status-class distribution, and range totals.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BillingApi.new
opts = {
  range: '7d' # String | Aggregation window ending now.
}

begin
  # Get usage summary
  result = api_instance.get_usage_summary(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->get_usage_summary: #{e}"
end
```

#### Using the get_usage_summary_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetUsageSummary200Response>, Integer, Hash)> get_usage_summary_with_http_info(opts)

```ruby
begin
  # Get usage summary
  data, status_code, headers = api_instance.get_usage_summary_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetUsageSummary200Response>
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->get_usage_summary_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **range** | **String** | Aggregation window ending now. | [optional][default to &#39;30d&#39;] |

### Return type

[**GetUsageSummary200Response**](GetUsageSummary200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_usage_tier

> <GetUsageTier200Response> get_usage_tier

Get tier and quota

Lightweight current-tier snapshot for status badges and quota meters — plan limits (monthly requests, daily AI requests, dynamic-pricing listings), the amount used, the amount remaining, and the next reset. `null` limits mean unlimited on that dimension.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::BillingApi.new

begin
  # Get tier and quota
  result = api_instance.get_usage_tier
  p result
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->get_usage_tier: #{e}"
end
```

#### Using the get_usage_tier_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetUsageTier200Response>, Integer, Hash)> get_usage_tier_with_http_info

```ruby
begin
  # Get tier and quota
  data, status_code, headers = api_instance.get_usage_tier_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetUsageTier200Response>
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->get_usage_tier_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetUsageTier200Response**](GetUsageTier200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

