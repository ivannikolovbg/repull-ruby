# Repull::ConversationsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**v1_conversations_get**](ConversationsApi.md#v1_conversations_get) | **GET** /v1/conversations | List conversations |
| [**v1_conversations_id_messages_get**](ConversationsApi.md#v1_conversations_id_messages_get) | **GET** /v1/conversations/{id}/messages | Get messages in conversation |
| [**v1_conversations_id_messages_post**](ConversationsApi.md#v1_conversations_id_messages_post) | **POST** /v1/conversations/{id}/messages | Send message |


## v1_conversations_get

> <V1ConversationsGet200Response> v1_conversations_get

List conversations

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConversationsApi.new

begin
  # List conversations
  result = api_instance.v1_conversations_get
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->v1_conversations_get: #{e}"
end
```

#### Using the v1_conversations_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<V1ConversationsGet200Response>, Integer, Hash)> v1_conversations_get_with_http_info

```ruby
begin
  # List conversations
  data, status_code, headers = api_instance.v1_conversations_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <V1ConversationsGet200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->v1_conversations_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**V1ConversationsGet200Response**](V1ConversationsGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## v1_conversations_id_messages_get

> <V1ConversationsIdMessagesGet200Response> v1_conversations_id_messages_get(id)

Get messages in conversation

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConversationsApi.new
id = 'id_example' # String | 

begin
  # Get messages in conversation
  result = api_instance.v1_conversations_id_messages_get(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->v1_conversations_id_messages_get: #{e}"
end
```

#### Using the v1_conversations_id_messages_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<V1ConversationsIdMessagesGet200Response>, Integer, Hash)> v1_conversations_id_messages_get_with_http_info(id)

```ruby
begin
  # Get messages in conversation
  data, status_code, headers = api_instance.v1_conversations_id_messages_get_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <V1ConversationsIdMessagesGet200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->v1_conversations_id_messages_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**V1ConversationsIdMessagesGet200Response**](V1ConversationsIdMessagesGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## v1_conversations_id_messages_post

> v1_conversations_id_messages_post(id, opts)

Send message

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ConversationsApi.new
id = 'id_example' # String | 
opts = {
  v1_conversations_id_messages_post_request: Repull::V1ConversationsIdMessagesPostRequest.new({message: 'message_example'}) # V1ConversationsIdMessagesPostRequest | 
}

begin
  # Send message
  api_instance.v1_conversations_id_messages_post(id, opts)
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->v1_conversations_id_messages_post: #{e}"
end
```

#### Using the v1_conversations_id_messages_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> v1_conversations_id_messages_post_with_http_info(id, opts)

```ruby
begin
  # Send message
  data, status_code, headers = api_instance.v1_conversations_id_messages_post_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->v1_conversations_id_messages_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **v1_conversations_id_messages_post_request** | [**V1ConversationsIdMessagesPostRequest**](V1ConversationsIdMessagesPostRequest.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

