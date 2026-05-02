# Repull::ConversationDetail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **platform** | **String** |  | [optional] |
| **guest_id** | **Integer** |  | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **reservation_id** | **Integer** |  | [optional] |
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

