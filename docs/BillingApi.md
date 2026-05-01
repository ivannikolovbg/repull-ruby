# Repull::BillingApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_billing_get**](BillingApi.md#v1_billing_get) | **GET** /v1/billing | Get plan and usage |
| [**v1_billing_post**](BillingApi.md#v1_billing_post) | **POST** /v1/billing | Create checkout session |


## v1_billing_get

> v1_billing_get

Get plan and usage

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
  # Get plan and usage
  api_instance.v1_billing_get
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->v1_billing_get: #{e}"
end
```

#### Using the v1_billing_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_billing_get_with_http_info

```ruby
begin
  # Get plan and usage
  data, status_code, headers = api_instance.v1_billing_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->v1_billing_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## v1_billing_post

> v1_billing_post(opts)

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
  v1_billing_post_request: Repull::V1BillingPostRequest.new # V1BillingPostRequest | 
}

begin
  # Create checkout session
  api_instance.v1_billing_post(opts)
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->v1_billing_post: #{e}"
end
```

#### Using the v1_billing_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_billing_post_with_http_info(opts)

```ruby
begin
  # Create checkout session
  data, status_code, headers = api_instance.v1_billing_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling BillingApi->v1_billing_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **v1_billing_post_request** | [**V1BillingPostRequest**](V1BillingPostRequest.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

