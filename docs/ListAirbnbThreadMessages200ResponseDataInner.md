# Repull::ListAirbnbThreadMessages200ResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull message id. | [optional] |
| **external_message_id** | **String** | Airbnb&#39;s message id. | [optional] |
| **thread_id** | **String** | The Airbnb thread id. | [optional] |
| **user_id** | **String** | Airbnb user id of the sender. | [optional] |
| **message** | **String** | Message text. Empty for a file-only message. | [optional] |
| **translated_message** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **sender_type** | **String** | &#x60;guest&#x60;, &#x60;host&#x60;, &#x60;user&#x60;, &#x60;system&#x60;, … | [optional] |
| **reservation_id** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **external_created_at** | **Time** | When Airbnb recorded the message. | [optional] |
| **attachments** | [**Array&lt;ConversationMessageAttachment&gt;**](ConversationMessageAttachment.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListAirbnbThreadMessages200ResponseDataInner.new(
  id: null,
  external_message_id: null,
  thread_id: null,
  user_id: null,
  message: null,
  translated_message: null,
  channel: airbnb,
  sender_type: null,
  reservation_id: null,
  created_at: null,
  updated_at: null,
  external_created_at: null,
  attachments: null
)
```

