# Repull::Message

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **external_message_id** | **String** | ID assigned by the source channel (Airbnb message id, Booking message id, etc.). Stable across syncs. | [optional] |
| **direction** | **String** |  | [optional] |
| **status** | **String** | Delivery state. Inbound messages are &#x60;received&#x60;. An outbound message is &#x60;sending&#x60; while it is queued to the channel, &#x60;sent&#x60; once the channel accepted it, or &#x60;failed&#x60;. Only &#x60;sent&#x60; (or &#x60;received&#x60;) means the guest can see it. | [optional] |
| **status_reason** | **String** | Why a message is still &#x60;sending&#x60; or &#x60;failed&#x60;, in plain words. &#x60;null&#x60; otherwise. | [optional] |
| **sender_type** | **String** | Free-form sender role from the channel (e.g. &#x60;guest&#x60;, &#x60;host&#x60;, &#x60;system&#x60;, &#x60;airbnb&#x60;). Use &#x60;direction&#x60; for binary inbound/outbound logic. | [optional] |
| **sender_name** | **String** |  | [optional] |
| **sender_avatar** | **String** |  | [optional] |
| **channel** | **String** | Delivery channel — &#x60;airbnb&#x60;, &#x60;booking&#x60;, &#x60;sms&#x60;, &#x60;email&#x60;, etc. | [optional] |
| **body** | **String** | Message body in the original language. | [optional] |
| **translated_body** | **String** | English translation when the original language is non-English and a translation has been computed. | [optional] |
| **attachments** | [**Array&lt;ConversationMessageAttachment&gt;**](ConversationMessageAttachment.md) | Files on this message, inbound or outbound. Empty array when there are none. A file-only message has an empty &#x60;body&#x60;. | [optional] |
| **is_automated** | **Boolean** | &#x60;true&#x60; when the message was sent by an automation (template, schedule, etc.). | [optional] |
| **ai_generated** | **Boolean** | &#x60;true&#x60; when the body was written by AI (autopilot, draft). | [optional] |
| **sent_at** | **Time** |  | [optional] |
| **delivered_at** | **Time** | When the message reached the channel. &#x60;null&#x60; while it is &#x60;sending&#x60; or when it &#x60;failed&#x60;. | [optional] |
| **read_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Message.new(
  id: null,
  external_message_id: null,
  direction: null,
  status: null,
  status_reason: null,
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

