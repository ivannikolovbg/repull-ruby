# Repull::ConversationDetail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **platform** | **String** |  | [optional] |
| **external_thread_id** | **String** | The source channel&#39;s own thread id (Airbnb thread id, Booking conversation id, …). Pass this as the &#x60;{threadId}&#x60; path param on &#x60;POST /v1/channels/airbnb/messaging/{threadId}/messages&#x60; to reply — it is the bridge from a unified conversation straight to the provider-specific send call. &#x60;null&#x60; when the thread has no external id yet (e.g. a website/email thread). | [optional] |
| **guest_id** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **reservation_id** | **String** |  | [optional] |
| **subject** | **String** | Thread subject (email/website channels) or null when not applicable. | [optional] |
| **last_message_at** | **Time** |  | [optional] |
| **last_message_preview** | **String** | Short preview of the most recent message body for list-UI rendering. | [optional] |
| **unread_count** | **Integer** |  | [optional] |
| **status** | **String** | &#x60;archived&#x60; is reserved for a future bit on &#x60;message_threads&#x60; — currently always &#x60;open&#x60;. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **host** | [**ConversationHost**](ConversationHost.md) |  | [optional] |
| **guest** | [**ConversationGuest**](ConversationGuest.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConversationDetail.new(
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
  guest: null
)
```

