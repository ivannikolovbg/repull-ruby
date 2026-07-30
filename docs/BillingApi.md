# Repull::BillingApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_billing_checkout**](BillingApi.md#create_billing_checkout) | **POST** /v1/billing | Create checkout session |


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

