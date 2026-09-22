# Repull::ConversationsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_conversation_special_offer**](ConversationsApi.md#create_conversation_special_offer) | **POST** /v1/conversations/{id}/special-offers | Send a special offer |
| [**get_conversation**](ConversationsApi.md#get_conversation) | **GET** /v1/conversations/{id} | Get conversation detail |
| [**get_conversation_special_offer**](ConversationsApi.md#get_conversation_special_offer) | **GET** /v1/conversations/{id}/special-offers/{offerId} | Get a special offer |
| [**list_conversation_messages**](ConversationsApi.md#list_conversation_messages) | **GET** /v1/conversations/{id}/messages | List messages in a conversation |
| [**list_conversations**](ConversationsApi.md#list_conversations) | **GET** /v1/conversations | List conversations |
| [**list_inquiries**](ConversationsApi.md#list_inquiries) | **GET** /v1/inquiries | List inquiries |
| [**preapprove_conversation**](ConversationsApi.md#preapprove_conversation) | **POST** /v1/conversations/{id}/pre-approval | Pre-approve an inquiry |
| [**send_conversation_message**](ConversationsApi.md#send_conversation_message) | **POST** /v1/conversations/{id}/messages | Send a message to the guest |
| [**withdraw_conversation_special_offer**](ConversationsApi.md#withdraw_conversation_special_offer) | **DELETE** /v1/conversations/{id}/special-offers/{offerId} | Withdraw a special offer |


## create_conversation_special_offer

> <CreateConversationSpecialOffer201Response> create_conversation_special_offer(id, create_conversation_special_offer_request, opts)

Send a special offer

Send the guest on this conversation an Airbnb special offer: your own dates, guest count and total price. The guest has 24 hours to book it. Use it to answer an inquiry with different terms, or to make a returning guest a custom price. To accept the guest’s own dates and price as they asked, pre-approve instead (`POST /v1/conversations/{id}/pre-approval`).  `listingId` is optional: omit it to offer the listing the guest asked about. It is a **Repull** listing id; Repull sends Airbnb its own listing id, using the link that belongs to this conversation’s Airbnb account.  `totalPrice` is the whole stay, in the listing’s Airbnb currency — Airbnb does not take a currency on an offer.  **Airbnb only**, and only for listings connected to Airbnb directly; anything else is `422 channel_not_supported` and nothing is sent. Runs the same action as the Vanio dashboard, so the inquiry is marked `special_offer_sent`.  An offer Airbnb refuses is never a `201`: dates that are taken, a price below Airbnb’s minimum, too many guests and the like are `422 airbnb_rejected` with Airbnb’s own reason in `message`.  Send `Idempotency-Key`: a repeat with the same key replays the first response instead of acting twice (a `409 idempotency_key_in_use` while the first is still running). A 5xx, a `429 airbnb_rate_limited` or a `403 connection_reauth_required` is not stored — nothing was done — so retrying with the same key reaches Airbnb again. Without it, a retry after a timeout can send the guest two offers.  Read or withdraw the offer with `GET` / `DELETE /v1/conversations/{id}/special-offers/{offerId}`.

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
id = 56 # Integer | Repull conversation id (from `GET /v1/conversations` or `conversationId` on `GET /v1/inquiries`) — not the Airbnb thread id.
create_conversation_special_offer_request = Repull::CreateConversationSpecialOfferRequest.new({check_in: Date.parse('Thu Oct 01 00:00:00 UTC 2026'), check_out: Date.parse('Mon Oct 05 00:00:00 UTC 2026'), guests: Repull::CreateConversationSpecialOfferRequestGuests.new({adults: 2}), total_price: 880}) # CreateConversationSpecialOfferRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
}

begin
  # Send a special offer
  result = api_instance.create_conversation_special_offer(id, create_conversation_special_offer_request, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->create_conversation_special_offer: #{e}"
end
```

#### Using the create_conversation_special_offer_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateConversationSpecialOffer201Response>, Integer, Hash)> create_conversation_special_offer_with_http_info(id, create_conversation_special_offer_request, opts)

```ruby
begin
  # Send a special offer
  data, status_code, headers = api_instance.create_conversation_special_offer_with_http_info(id, create_conversation_special_offer_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateConversationSpecialOffer201Response>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->create_conversation_special_offer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull conversation id (from &#x60;GET /v1/conversations&#x60; or &#x60;conversationId&#x60; on &#x60;GET /v1/inquiries&#x60;) — not the Airbnb thread id. |  |
| **create_conversation_special_offer_request** | [**CreateConversationSpecialOfferRequest**](CreateConversationSpecialOfferRequest.md) |  |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**CreateConversationSpecialOffer201Response**](CreateConversationSpecialOffer201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_conversation

> <ConversationDetail> get_conversation(id, opts)

Get conversation detail

Returns one thread (the same shape as the list-row `Conversation`) plus expanded `host` (from `airbnb_hosts` for the thread's `host_id`) and `guest` (resolved via the thread's `reservation_id`, with up to 50 contacts) blocks.  A conversation that belongs to an inactive listing (by the thread's listing or its reservation's listing) returns `403 listing_inactive`. Inactive listings keep syncing; activate the listing to use it here.

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


## get_conversation_special_offer

> <CreateConversationSpecialOffer201Response> get_conversation_special_offer(id, offer_id)

Get a special offer

Read a special offer on this conversation back from Airbnb — typically to check its `status` (`active` until the guest books it, it expires, or you withdraw it). Read live from Airbnb with the conversation’s own Airbnb account.

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
id = 56 # Integer | Repull conversation id (from `GET /v1/conversations` or `conversationId` on `GET /v1/inquiries`) — not the Airbnb thread id.
offer_id = '1459920384' # String | The special offer’s `id`, as returned by `POST /v1/conversations/{id}/special-offers`.

begin
  # Get a special offer
  result = api_instance.get_conversation_special_offer(id, offer_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->get_conversation_special_offer: #{e}"
end
```

#### Using the get_conversation_special_offer_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateConversationSpecialOffer201Response>, Integer, Hash)> get_conversation_special_offer_with_http_info(id, offer_id)

```ruby
begin
  # Get a special offer
  data, status_code, headers = api_instance.get_conversation_special_offer_with_http_info(id, offer_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateConversationSpecialOffer201Response>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->get_conversation_special_offer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull conversation id (from &#x60;GET /v1/conversations&#x60; or &#x60;conversationId&#x60; on &#x60;GET /v1/inquiries&#x60;) — not the Airbnb thread id. |  |
| **offer_id** | **String** | The special offer’s &#x60;id&#x60;, as returned by &#x60;POST /v1/conversations/{id}/special-offers&#x60;. |  |

### Return type

[**CreateConversationSpecialOffer201Response**](CreateConversationSpecialOffer201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_conversation_messages

> <MessageListResponse> list_conversation_messages(id, opts)

List messages in a conversation

Cursor-paginated messages within one thread. Defaults to newest-first (`?order=desc`); pass `?order=asc` for chronological replay. Use `pagination.nextCursor` from one response as the `cursor` query param of the next request.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`.  A conversation that belongs to an inactive listing returns `403 listing_inactive`. Inactive listings keep syncing; activate the listing to use it here.

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
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.nextCursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
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
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
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

Cursor-paginated list of message threads owned by the workspace. Backed by main vanio's `/api/threads/list` which keyset-paginates against `(last_message_at, id)` for constant per-page cost. Use `pagination.nextCursor` from one response as the `cursor` query param of the next request.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`.  Filters: `platform` (`airbnb`|`booking`|`vrbo`|`website`|`email`), `status` (`open`|`archived` — `archived` is a stable no-op until the bit lands on `message_threads`).  **Inactive listings:** conversations that belong to an inactive listing (by the thread's listing or its reservation's listing) are left out of the page and of `pagination.total`. Inactive listings keep syncing; activate the listing to use it here.

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
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.nextCursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
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
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
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


## list_inquiries

> <ListInquiries200Response> list_inquiries(opts)

List inquiries

Airbnb inquiries — guests asking about dates before booking — newest first. By default only `open` ones: nobody has answered and the stay is still ahead. Answer one with `POST /v1/conversations/{conversationId}/pre-approval` (accept their dates and price) or `POST /v1/conversations/{conversationId}/special-offers` (your own terms).  Booking **requests** are not inquiries: they are reservations with status `pending` — list them with `GET /v1/reservations?status=pending` and answer with `POST /v1/reservations/{id}/accept` or `/decline`.  **Pagination:** pass `pagination.nextCursor` back as `?cursor=` until `pagination.hasMore` is `false`. `?offset=` also works (0..10000). `limit` defaults to 50, max 100.  Inquiries on inactive listings are left out; `?listing_id=` naming an inactive listing returns `403 listing_inactive`. `X-Account-Id` narrows to one connected account.

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
  status: 'open', # String | Which inquiries to return. `all` returns every one.
  listing_id: 56, # Integer | Only inquiries about this Repull listing.
  conversation_id: 56, # Integer | The inquiry on one conversation — combine with `status=all` to see it whatever its state.
  limit: 56, # Integer | Max inquiries per page (default 50, cap 100; over the cap returns 422).
  cursor: 'cursor_example', # String | Opaque base64 cursor returned in the previous response's `pagination.nextCursor`. Omit to fetch the first page.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.nextCursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  include_total: true # Boolean | When `true` (default), the response's `pagination.total` carries the count of rows matching the current filter, across all pages. Pass `false` to skip the count for very large workspaces where the per-page COUNT(*) cost matters.
}

begin
  # List inquiries
  result = api_instance.list_inquiries(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->list_inquiries: #{e}"
end
```

#### Using the list_inquiries_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListInquiries200Response>, Integer, Hash)> list_inquiries_with_http_info(opts)

```ruby
begin
  # List inquiries
  data, status_code, headers = api_instance.list_inquiries_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListInquiries200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->list_inquiries_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | Which inquiries to return. &#x60;all&#x60; returns every one. | [optional][default to &#39;open&#39;] |
| **listing_id** | **Integer** | Only inquiries about this Repull listing. | [optional] |
| **conversation_id** | **Integer** | The inquiry on one conversation — combine with &#x60;status&#x3D;all&#x60; to see it whatever its state. | [optional] |
| **limit** | **Integer** | Max inquiries per page (default 50, cap 100; over the cap returns 422). | [optional][default to 50] |
| **cursor** | **String** | Opaque base64 cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **include_total** | **Boolean** | When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. | [optional][default to true] |

### Return type

[**ListInquiries200Response**](ListInquiries200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## preapprove_conversation

> <PreapproveConversation201Response> preapprove_conversation(id, opts)

Pre-approve an inquiry

Pre-approve the Airbnb inquiry on this conversation: the guest who asked about dates may now book them at the listed price, without waiting on you. To change the dates, guests or price, send a special offer instead (`POST /v1/conversations/{id}/special-offers`).  Find inquiries that need an answer with `GET /v1/inquiries` (default `status=open`); each carries the `conversationId` to use here.  **Airbnb only**, and only for listings connected to Airbnb directly. A Booking.com, VRBO or direct-booking conversation, or an Airbnb one relayed through a PMS (Hostaway, Guesty), returns `422 channel_not_supported` and nothing is sent.  Runs the same action as the Vanio dashboard’s Pre-approve button, so the inquiry is marked `pre_approved` everywhere.  An Airbnb refusal is never reported as a success: an inquiry that already moved on is `409 inquiry_no_longer_open`, an expired one `409 inquiry_expired`, a conversation that already has a booking `409 conversation_already_booked`.  Send `Idempotency-Key`: a repeat with the same key replays the first response instead of acting twice (a `409 idempotency_key_in_use` while the first is still running). A 5xx, a `429 airbnb_rate_limited` or a `403 connection_reauth_required` is not stored — nothing was done — so retrying with the same key reaches Airbnb again.

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
id = 56 # Integer | Repull conversation id (from `GET /v1/conversations` or `conversationId` on `GET /v1/inquiries`) — not the Airbnb thread id.
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31', # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
  preapprove_conversation_request: Repull::PreapproveConversationRequest.new # PreapproveConversationRequest | 
}

begin
  # Pre-approve an inquiry
  result = api_instance.preapprove_conversation(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->preapprove_conversation: #{e}"
end
```

#### Using the preapprove_conversation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PreapproveConversation201Response>, Integer, Hash)> preapprove_conversation_with_http_info(id, opts)

```ruby
begin
  # Pre-approve an inquiry
  data, status_code, headers = api_instance.preapprove_conversation_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PreapproveConversation201Response>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->preapprove_conversation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull conversation id (from &#x60;GET /v1/conversations&#x60; or &#x60;conversationId&#x60; on &#x60;GET /v1/inquiries&#x60;) — not the Airbnb thread id. |  |
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |
| **preapprove_conversation_request** | [**PreapproveConversationRequest**](PreapproveConversationRequest.md) |  | [optional] |

### Return type

[**PreapproveConversation201Response**](PreapproveConversation201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## send_conversation_message

> <SendMessageResponse> send_conversation_message(id, send_message_request, opts)

Send a message to the guest

Sends a message to the guest on this conversation and records it in the thread.  Omit `channel` and the message goes out on whichever channel the conversation already uses (Airbnb, Booking.com, SMS, email or the direct-booking site) — that is the right default. Pass `channel` only to force a specific one.  The message is attributed to the API, not to Vanio AI: it is recorded with `aiGenerated` false so an API send is never counted as an automated reply.  ### Airbnb rewrites links — check `contentRewritten`  Airbnb rejects guest messages containing a link, an email address or a phone number, and names the offending text. When that happens the offending fragment is stripped and the remainder is re-sent once, which means **the guest receives a message that is not the one you wrote**. Reporting that as a plain success would be a lie, so every response carries `contentRewritten`; when it is `true`, `deliveredContent` is the text that actually reached the guest. Check it before assuming your message went out verbatim.  When the text cannot be salvaged (the link is most of the message) nothing is delivered and the call returns `422 message_not_sent` with the channel's verbatim refusal in `statusReason`.  Send `Idempotency-Key` — without it, retrying after a network timeout sends the guest the same message twice.  ### Attachments  Send files with `attachments: [{ url, contentType?, filename? }]` — public `https://` URLs, up to 5 per request, 10 MB each. `message` may be omitted when there are attachments (except on Booking.com). Repull downloads each file, reads its real type from the bytes, keeps a durable copy and delivers it through the channel's own file flow. **Every file is checked before anything is sent**: if one is unreachable, too large or of a type the channel refuses, the call returns 422 naming the file (`index`) and the guest receives nothing.  | Channel | Accepted types | Text | How it arrives | |---|---|---|---| | Airbnb | JPEG, PNG, GIF, WebP (converted to JPEG), MP4, QuickTime | optional | each file as its own message, then the text as a separate message | | Booking.com | JPEG, PNG | **required** | one message carrying the text and every file | | SMS, email, direct-booking site chat | — | — | `422 attachments_not_supported`, nothing sent |  Airbnb does not allow files in pre-booking (inquiry) conversations; that refusal comes back as `422 message_not_sent`. Because Airbnb delivers files one message at a time, a later file can be refused after earlier ones arrived — that returns `422 message_partially_sent` with `parts` saying exactly which messages reached the guest; resend only the rest.  The response's `attachments` lists each file's durable `url`, and `parts` lists every channel message the send produced. Read-back (`GET /v1/conversations/{id}/messages`) shows the same files in each message's `attachments`.  **Inactive listings:** a conversation that belongs to an inactive listing returns `403 listing_inactive` and no message is sent. Activate the listing first.

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
send_message_request = Repull::SendMessageRequest.new # SendMessageRequest | 
opts = {
  idempotency_key: '9f1c2f7e-4a3b-4f2e-9c8d-1b6a0e5d7c31' # String | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged `Idempotency-Status: cached` — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → `409 idempotency_key_in_use`. - Same key with a DIFFERENT payload → `422 idempotency_key_reused`. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status >= 500, `408`, `425` and `429`, and the refusals that happen before anything is done and tell you to fix something outside the request first — `connection_reauth_required`, `listing_inactive`, and the rate/daily limits. Every other answer, including a final refusal such as `422 airbnb_rejected`, is stored and replayed.
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
| **idempotency_key** | **String** | Makes a retry of this request safe. Send a unique string (a UUID generated at the point you build the request) and the response is stored for 24 hours: a repeat with the SAME key replays that stored response — tagged &#x60;Idempotency-Status: cached&#x60; — without running the operation again, so no duplicate reservation, guest or guest message is created.  - Same key while the first request is still in flight → &#x60;409 idempotency_key_in_use&#x60;. - Same key with a DIFFERENT payload → &#x60;422 idempotency_key_reused&#x60;. Generate a new key per distinct request; reuse one only when retrying that exact request. - Retryable outcomes are deliberately not stored, so a retry with the same key runs for real: any status &gt;&#x3D; 500, &#x60;408&#x60;, &#x60;425&#x60; and &#x60;429&#x60;, and the refusals that happen before anything is done and tell you to fix something outside the request first — &#x60;connection_reauth_required&#x60;, &#x60;listing_inactive&#x60;, and the rate/daily limits. Every other answer, including a final refusal such as &#x60;422 airbnb_rejected&#x60;, is stored and replayed. | [optional] |

### Return type

[**SendMessageResponse**](SendMessageResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## withdraw_conversation_special_offer

> <WithdrawConversationSpecialOffer200Response> withdraw_conversation_special_offer(id, offer_id)

Withdraw a special offer

Withdraw a special offer the guest has not booked yet, so it can no longer be booked. Runs the same action as the Vanio dashboard’s Withdraw offer. An offer the guest already booked cannot be withdrawn — Airbnb refuses with `409 inquiry_no_longer_open`; cancel the booking instead.

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
id = 56 # Integer | Repull conversation id (from `GET /v1/conversations` or `conversationId` on `GET /v1/inquiries`) — not the Airbnb thread id.
offer_id = '1459920384' # String | The special offer’s `id`, as returned by `POST /v1/conversations/{id}/special-offers`.

begin
  # Withdraw a special offer
  result = api_instance.withdraw_conversation_special_offer(id, offer_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->withdraw_conversation_special_offer: #{e}"
end
```

#### Using the withdraw_conversation_special_offer_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WithdrawConversationSpecialOffer200Response>, Integer, Hash)> withdraw_conversation_special_offer_with_http_info(id, offer_id)

```ruby
begin
  # Withdraw a special offer
  data, status_code, headers = api_instance.withdraw_conversation_special_offer_with_http_info(id, offer_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WithdrawConversationSpecialOffer200Response>
rescue Repull::ApiError => e
  puts "Error when calling ConversationsApi->withdraw_conversation_special_offer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull conversation id (from &#x60;GET /v1/conversations&#x60; or &#x60;conversationId&#x60; on &#x60;GET /v1/inquiries&#x60;) — not the Airbnb thread id. |  |
| **offer_id** | **String** | The special offer’s &#x60;id&#x60;, as returned by &#x60;POST /v1/conversations/{id}/special-offers&#x60;. |  |

### Return type

[**WithdrawConversationSpecialOffer200Response**](WithdrawConversationSpecialOffer200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

