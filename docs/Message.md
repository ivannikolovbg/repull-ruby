# Repull::Message

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **conversation_id** | **String** |  | [optional] |
| **sender_type** | **String** |  | [optional] |
| **sender_name** | **String** |  | [optional] |
| **message** | **String** |  | [optional] |
| **sent_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Message.new(
  id: null,
  conversation_id: null,
  sender_type: null,
  sender_name: null,
  message: null,
  sent_at: null
)
```

