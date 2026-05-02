# Repull::AIApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_ai_operation**](AIApi.md#create_ai_operation) | **POST** /v1/ai | AI operation |


## create_ai_operation

> <CreateAiOperation200Response> create_ai_operation(opts)

AI operation

Perform an AI-powered operation.  Operations: - `respond-to-guest` — Generate a contextual guest response - `classify-intent` — Classify the intent of a guest message - `generate-listing` — Generate optimized listing description - `review-response` — Generate a review response - `price-suggestion` — Get AI pricing suggestions

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::AIApi.new
opts = {
  ai_operation: Repull::AIOperation.new # AIOperation | 
}

begin
  # AI operation
  result = api_instance.create_ai_operation(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling AIApi->create_ai_operation: #{e}"
end
```

#### Using the create_ai_operation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateAiOperation200Response>, Integer, Hash)> create_ai_operation_with_http_info(opts)

```ruby
begin
  # AI operation
  data, status_code, headers = api_instance.create_ai_operation_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateAiOperation200Response>
rescue Repull::ApiError => e
  puts "Error when calling AIApi->create_ai_operation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ai_operation** | [**AIOperation**](AIOperation.md) |  | [optional] |

### Return type

[**CreateAiOperation200Response**](CreateAiOperation200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

