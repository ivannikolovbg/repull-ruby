# Repull::ConversationDetail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account** | [**RecordAccount**](RecordAccount.md) | The connected account this conversation belongs to, the same block as the message webhooks. On the list and on &#x60;GET /v1/conversations/{id}&#x60;. | [optional] |
| **airbnb_access** | [**AirbnbAccess**](AirbnbAccess.md) | Airbnb conversations, on &#x60;GET /v1/conversations/{id}&#x60;: every account on the listing (owner and co-hosts) with its state, and &#x60;defaultAccount&#x60; — the one a send uses when &#x60;account&#x60; is not given. Pass any connected one as &#x60;account&#x60; on &#x60;POST /v1/conversations/{id}/messages&#x60; to send as it. | [optional] |
| **id** | **String** |  | [optional] |
| **platform** | **String** |  | [optional] |
| **external_thread_id** | **String** | The source channel&#39;s own thread id (Airbnb thread id, Booking conversation id, …). Pass this as the &#x60;{threadId}&#x60; path param on &#x60;POST /v1/channels/airbnb/messaging/{threadId}/messages&#x60; to reply — it is the bridge from a unified conversation straight to the provider-specific send call. &#x60;null&#x60; when the thread has no external id yet (e.g. a website/email thread). | [optional] |
| **guest_id** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **reservation_id** | **String** |  | [optional] |
| **subject** | **String** | Thread subject (email/website channels) or null when not applicable. | [optional] |
| **last_message_at** | **Time** | The conversation&#39;s newest activity: the time of its newest message (after an import, the newest imported message&#39;s own time, not the import time), or of a later change to the conversation. &#x60;GET /v1/conversations&#x60; sorts on it by default. | [optional] |
| **last_message_preview** | **String** | Short preview of the most recent message body for list-UI rendering. | [optional] |
| **unread_count** | **Integer** |  | [optional] |
| **status** | **String** | &#x60;archived&#x60; is reserved for a future bit on &#x60;message_threads&#x60; — currently always &#x60;open&#x60;. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** | When the conversation record last changed; the watermark for &#x60;updated_since&#x60;. | [optional] |
| **host** | [**ConversationHost**](ConversationHost.md) |  | [optional] |
| **guest** | [**ConversationGuest**](ConversationGuest.md) |  | [optional] |
| **capabilities** | [**ConversationCapabilities**](ConversationCapabilities.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConversationDetail.new(
  account: null,
  airbnb_access: null,
  id: null,
  platform: airbnb,
  external_thread_id: null,
  guest_id: null,
  listing_id: null,
  reservation_id: null,
  subject: null,
  last_message_at: null,
  last_message_preview: null,
  unread_count: null,
  status: null,
  created_at: null,
  updated_at: null,
  host: null,
  guest: null,
  capabilities: null
)
```

