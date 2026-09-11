# Repull::ConversationsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_conversation**](ConversationsApi.md#get_conversation) | **GET** /v1/conversations/{id} | Get conversation detail |
| [**list_conversation_messages**](ConversationsApi.md#list_conversation_messages) | **GET** /v1/conversations/{id}/messages | List messages in a conversation |
| [**list_conversations**](ConversationsApi.md#list_conversations) | **GET** /v1/conversations | List conversations |
| [**send_conversation_message**](ConversationsApi.md#send_conversation_message) | **POST** /v1/conversations/{id}/messages | Send a message to the guest |


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

Cursor-paginated messages within one thread. Defaults to newest-first (`?order=desc`); pass `?order=asc` for chronological replay. Use `pagination.nextCursor` from one response as the `cursor` query param of the next request.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`.

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
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.next_cursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
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
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.next_cursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
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

Cursor-paginated list of message threads owned by the workspace. Backed by main vanio's `/api/threads/list` which keyset-paginates against `(last_message_at, id)` for constant per-page cost. Use `pagination.nextCursor` from one response as the `cursor` query param of the next request.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`.  Filters: `platform` (`airbnb`|`booking`|`vrbo`|`website`|`email`), `status` (`open`|`archived` — `archived` is a stable no-op until the bit lands on `message_threads`).

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
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`. Omit to fetch the first page.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.next_cursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
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
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.next_cursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
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


## send_conversation_message

> <SendMessageResponse> send_conversation_message(id, send_message_request, opts)

Send a message to the guest

Sends a message to the guest on this conversation and records it in the thread.  Omit `channel` and the message goes out on whichever channel the conversation already uses (Airbnb, Booking.com, SMS, email or the direct-booking site) — that is the right default. Pass `channel` only to force a specific one.  The message is attributed to the API, not to Vanio AI: it is recorded with `aiGenerated` false so an API send is never counted as an automated reply.  ### Airbnb rewrites links — check `contentRewritten`  Airbnb rejects guest messages containing a link, an email address or a phone number, and names the offending text. When that happens the offending fragment is stripped and the remainder is re-sent once, which means **the guest receives a message that is not the one you wrote**. Reporting that as a plain success would be a lie, so every response carries `contentRewritten`; when it is `true`, `deliveredContent` is the text that actually reached the guest. Check it before assuming your message went out verbatim.  When the text cannot be salvaged (the link is most of the message) nothing is delivered and the call returns `422 message_not_sent` with the channel's verbatim refusal in `statusReason`.  Send `Idempotency-Key` — without it, retrying after a network timeout sends the guest the same message twice.

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
send_message_request = Repull::SendMessageRequest.new({message: 'Your check-in details are ready — the door code is active from 16:00.'}) # SendMessageRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Responses with status >= 500 are deliberately not stored, so a server error stays retryable.
}

begin
  # Send a message to the guest
  result = api_instance.send_conversation_message(id, send_message_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->send_conversation_message: #{e}"
end
```

#### Using the send_conversation_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SendMessageResponse>, Integer, Hash)> send_conversation_message_with_http_info(id, send_message_request, opts)

```ruby
begin
  # Send a message to the guest
  data, status_code, headers = api_instance.send_conversation_message_with_http_info(id, send_message_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SendMessageResponse>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->send_conversation_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull thread id. |  |
| **send_message_request** | [**SendMessageRequest**](SendMessageRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Responses with status &gt;&#x3D; 500 are deliberately not stored, so a server error stays retryable. | [optional] |

### Return type

[**SendMessageResponse**](SendMessageResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

