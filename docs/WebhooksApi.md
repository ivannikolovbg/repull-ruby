# Repull::WebhooksApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_webhooks_get**](WebhooksApi.md#v1_webhooks_get) | **GET** /v1/webhooks | List webhook subscriptions |
| [**v1_webhooks_post**](WebhooksApi.md#v1_webhooks_post) | **POST** /v1/webhooks | Create webhook subscription |
| [**v1_webhooks_test_post**](WebhooksApi.md#v1_webhooks_test_post) | **POST** /v1/webhooks/test | Send test webhook |


## v1_webhooks_get

> <V1WebhooksGet200Response> v1_webhooks_get

List webhook subscriptions

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::WebhooksApi.new

begin
  # List webhook subscriptions
  result = api_instance.v1_webhooks_get
  p result
rescue Repull::ApiError => e
  puts "Error when calling WebhooksApi->v1_webhooks_get: #{e}"
end
```

#### Using the v1_webhooks_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<V1WebhooksGet200Response>, Integer, Hash)> v1_webhooks_get_with_http_info

```ruby
begin
  # List webhook subscriptions
  data, status_code, headers = api_instance.v1_webhooks_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <V1WebhooksGet200Response>
rescue Repull::ApiError => e
  puts "Error when calling WebhooksApi->v1_webhooks_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**V1WebhooksGet200Response**](V1WebhooksGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## v1_webhooks_post

> <WebhookSubscription> v1_webhooks_post(opts)

Create webhook subscription

Subscribe to events. Supported events: reservation.created, reservation.updated, reservation.cancelled, message.received, listing.updated, calendar.updated, guest.created, payment.received

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::WebhooksApi.new
opts = {
  v1_webhooks_post_request: Repull::V1WebhooksPostRequest.new({url: 'url_example', events: ['events_example']}) # V1WebhooksPostRequest | 
}

begin
  # Create webhook subscription
  result = api_instance.v1_webhooks_post(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling WebhooksApi->v1_webhooks_post: #{e}"
end
```

#### Using the v1_webhooks_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookSubscription>, Integer, Hash)> v1_webhooks_post_with_http_info(opts)

```ruby
begin
  # Create webhook subscription
  data, status_code, headers = api_instance.v1_webhooks_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookSubscription>
rescue Repull::ApiError => e
  puts "Error when calling WebhooksApi->v1_webhooks_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **v1_webhooks_post_request** | [**V1WebhooksPostRequest**](V1WebhooksPostRequest.md) |  | [optional] |

### Return type

[**WebhookSubscription**](WebhookSubscription.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## v1_webhooks_test_post

> v1_webhooks_test_post(opts)

Send test webhook

Delivers a test payload to your webhook URL.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::WebhooksApi.new
opts = {
  v1_webhooks_test_post_request: Repull::V1WebhooksTestPostRequest.new # V1WebhooksTestPostRequest | 
}

begin
  # Send test webhook
  api_instance.v1_webhooks_test_post(opts)
rescue Repull::ApiError => e
  puts "Error when calling WebhooksApi->v1_webhooks_test_post: #{e}"
end
```

#### Using the v1_webhooks_test_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_webhooks_test_post_with_http_info(opts)

```ruby
begin
  # Send test webhook
  data, status_code, headers = api_instance.v1_webhooks_test_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling WebhooksApi->v1_webhooks_test_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **v1_webhooks_test_post_request** | [**V1WebhooksTestPostRequest**](V1WebhooksTestPostRequest.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

