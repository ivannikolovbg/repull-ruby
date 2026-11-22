# Repull::ListVrboThreadMessages200ResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull message id. | [optional] |
| **external_message_id** | **String** |  | [optional] |
| **thread_id** | **String** | The Vrbo conversation id. | [optional] |
| **message** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **sender_type** | **String** | &#x60;guest&#x60;, &#x60;host&#x60;, &#x60;system&#x60;, … | [optional] |
| **reservation_id** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **external_created_at** | **Time** |  | [optional] |
| **attachments** | [**Array&lt;ConversationMessageAttachment&gt;**](ConversationMessageAttachment.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListVrboThreadMessages200ResponseDataInner.new(
  id: null,
  external_message_id: null,
  thread_id: null,
  message: null,
  channel: vrbo,
  sender_type: null,
  reservation_id: null,
  created_at: null,
  external_created_at: null,
  attachments: null
)
```

