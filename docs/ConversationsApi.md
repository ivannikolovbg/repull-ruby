# Repull::ConversationsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_conversation**](ConversationsApi.md#get_conversation) | **GET** /v1/conversations/{id} | Get conversation detail |
| [**list_conversation_messages**](ConversationsApi.md#list_conversation_messages) | **GET** /v1/conversations/{id}/messages | List messages in a conversation |
| [**list_conversations**](ConversationsApi.md#list_conversations) | **GET** /v1/conversations | List conversations |


## get_conversation

> <ConversationDetail> get_conversation(id, opts)

Get conversation detail

Returns one thread (the same shape as the list-row `Conversation`) plus expanded `host` (from `airbnb_hosts` for the thread's `host_id`) and `guest` (resolved via the thread's `reservation_id`, with up to 50 contacts) blocks.

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
id = 56 # Integer | Internal Repull thread id.
opts = {
  x_schema: 'my-app-schema' # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
}

begin
  # Get conversation detail
  result = api_instance.get_conversation(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->get_conversation: #{e}"
end
```

#### Using the get_conversation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConversationDetail>, Integer, Hash)> get_conversation_with_http_info(id, opts)

```ruby
begin
  # Get conversation detail
  data, status_code, headers = api_instance.get_conversation_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConversationDetail>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->get_conversation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull thread id. |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |

### Return type

[**ConversationDetail**](ConversationDetail.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_conversation_messages

> <MessageListResponse> list_conversation_messages(id, opts)

List messages in a conversation

Cursor-paginated messages within one thread. Defaults to newest-first (`?order=desc`); pass `?order=asc` for chronological replay. Use `pagination.next_cursor` from one response as the `cursor` query param of the next request.

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
id = 56 # Integer | Internal Repull thread id.
opts = {
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.next_cursor`.
  limit: 56, # Integer | 
  order: 'asc' # String | `desc` (default) returns newest first. `asc` returns chronological replay.
}

begin
  # List messages in a conversation
  result = api_instance.list_conversation_messages(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->list_conversation_messages: #{e}"
end
```

#### Using the list_conversation_messages_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MessageListResponse>, Integer, Hash)> list_conversation_messages_with_http_info(id, opts)

```ruby
begin
  # List messages in a conversation
  data, status_code, headers = api_instance.list_conversation_messages_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MessageListResponse>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->list_conversation_messages_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull thread id. |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.next_cursor&#x60;. | [optional] |
| **limit** | **Integer** |  | [optional][default to 20] |
| **order** | **String** | &#x60;desc&#x60; (default) returns newest first. &#x60;asc&#x60; returns chronological replay. | [optional][default to &#39;desc&#39;] |

### Return type

[**MessageListResponse**](MessageListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_conversations

> <ConversationListResponse> list_conversations(opts)

List conversations

Cursor-paginated list of message threads owned by the workspace. Backed by main vanio's `/api/threads/list` which keyset-paginates against `(last_message_at, id)` for constant per-page cost. Use `pagination.next_cursor` from one response as the `cursor` query param of the next request.  Filters: `platform` (`airbnb`|`booking`|`vrbo`|`website`|`email`), `status` (`open`|`archived` — `archived` is a stable no-op until the bit lands on `message_threads`).

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
opts = {
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.next_cursor`. Omit to fetch the first page.
  limit: 56, # Integer | Max items per page. Hard cap is 100.
  platform: 'airbnb', # String | Restrict to threads on a single channel.
  status: 'open' # String | Filter by archive status. `archived` currently always returns an empty page — kept for forward-compat.
}

begin
  # List conversations
  result = api_instance.list_conversations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->list_conversations: #{e}"
end
```

#### Using the list_conversations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConversationListResponse>, Integer, Hash)> list_conversations_with_http_info(opts)

```ruby
begin
  # List conversations
  data, status_code, headers = api_instance.list_conversations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConversationListResponse>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->list_conversations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.next_cursor&#x60;. Omit to fetch the first page. | [optional] |
| **limit** | **Integer** | Max items per page. Hard cap is 100. | [optional][default to 20] |
| **platform** | **String** | Restrict to threads on a single channel. | [optional] |
| **status** | **String** | Filter by archive status. &#x60;archived&#x60; currently always returns an empty page — kept for forward-compat. | [optional] |

### Return type

[**ConversationListResponse**](ConversationListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

