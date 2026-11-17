# Repull::ConversationMessageStatusChangedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **conversation_id** | **String** | The conversation (&#x60;GET /v1/conversations/{id}&#x60;). |  |
| **message_id** | **String** | The message, as &#x60;id&#x60; on the send response and on &#x60;GET /v1/conversations/{id}/messages&#x60;. |  |
| **status** | **String** | The new delivery status. |  |
| **status_reason** | **String** | Why it &#x60;failed&#x60;, in plain words. &#x60;null&#x60; when &#x60;sent&#x60;. |  |

## Example

```ruby
require 'repull'

instance = Repull::ConversationMessageStatusChangedPayload.new(
  conversation_id: 549555,
  message_id: 1861207,
  status: null,
  status_reason: null
)
```

