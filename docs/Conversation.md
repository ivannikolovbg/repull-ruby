# Repull::Conversation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **reservation_id** | **Integer** |  | [optional] |
| **guest_name** | **String** |  | [optional] |
| **last_message** | **String** |  | [optional] |
| **last_message_at** | **Time** |  | [optional] |
| **unread_count** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Conversation.new(
  id: null,
  reservation_id: null,
  guest_name: null,
  last_message: null,
  last_message_at: null,
  unread_count: null
)
```

