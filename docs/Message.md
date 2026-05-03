# Repull::Message

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **external_message_id** | **String** | ID assigned by the source channel (Airbnb message id, Booking message id, etc.). Stable across syncs. | [optional] |
| **direction** | **String** |  | [optional] |
| **sender_type** | **String** | Free-form sender role from the channel (e.g. &#x60;guest&#x60;, &#x60;host&#x60;, &#x60;system&#x60;, &#x60;airbnb&#x60;). Use &#x60;direction&#x60; for binary inbound/outbound logic. | [optional] |
| **sender_name** | **String** |  | [optional] |
| **sender_avatar** | **String** |  | [optional] |
| **channel** | **String** | Delivery channel — &#x60;airbnb&#x60;, &#x60;booking&#x60;, &#x60;sms&#x60;, &#x60;email&#x60;, etc. | [optional] |
| **body** | **String** | Message body in the original language. | [optional] |
| **translated_body** | **String** | English translation when the original language is non-English and a translation has been computed. | [optional] |
| **attachments** | [**Array&lt;ConversationMessageAttachment&gt;**](ConversationMessageAttachment.md) |  | [optional] |
| **is_automated** | **Boolean** | &#x60;true&#x60; when the message was sent by a Vanio automation (template, schedule, etc.). | [optional] |
| **ai_generated** | **Boolean** | &#x60;true&#x60; when the body was authored by Vanio AI (autopilot, draft). | [optional] |
| **sent_at** | **Time** |  | [optional] |
| **delivered_at** | **Time** |  | [optional] |
| **read_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Message.new(
  id: null,
  external_message_id: null,
  direction: null,
  sender_type: null,
  sender_name: null,
  sender_avatar: null,
  channel: null,
  body: null,
  translated_body: null,
  attachments: null,
  is_automated: null,
  ai_generated: null,
  sent_at: null,
  delivered_at: null,
  read_at: null
)
```

