# Repull::SendMessagePart

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **attachment_indexes** | **Array&lt;Integer&gt;** | Indexes into the request&#39;s &#x60;attachments&#x60; that this message carried. | [optional] |
| **has_text** | **Boolean** | Whether this message carried the text. | [optional] |
| **sent** | **Boolean** |  | [optional] |
| **message_id** | **String** |  | [optional] |
| **external_message_id** | **String** |  | [optional] |
| **error** | **String** | Why this part was not delivered. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SendMessagePart.new(
  attachment_indexes: null,
  has_text: null,
  sent: null,
  message_id: null,
  external_message_id: null,
  error: null
)
```

