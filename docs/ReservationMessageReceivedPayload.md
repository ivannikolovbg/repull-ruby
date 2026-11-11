# Repull::ReservationMessageReceivedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | Booking.com only: the hotel (property) id of the conversation&#39;s listing. Absent on other channels. A Booking.com Extranet login can cover several hotels, so use this to route the message. | [optional] |
| **reservation_id** | **Integer** | The reservation the conversation belongs to. &#x60;null&#x60; for an inquiry, or a message that arrived before its booking was imported (&#x60;reservation.thread.assigned&#x60; fires when it is attached). | [optional] |
| **thread_id** | **String** | The Repull conversation id: the numeric id, as a string. Pass it as &#x60;{id}&#x60; to &#x60;GET /v1/conversations/{id}&#x60; and &#x60;GET /v1/conversations/{id}/messages&#x60;. | [optional] |
| **external_thread_id** | **String** | The channel&#39;s own thread id (Airbnb thread id, Booking.com conversation id). Same as &#x60;externalThreadId&#x60; on &#x60;GET /v1/conversations/{id}&#x60;. | [optional] |
| **listing_id** | **Integer** | The Repull listing the conversation is about. | [optional] |
| **channel** | **String** | The channel the message came through: &#x60;airbnb&#x60;, &#x60;booking&#x60;, &#x60;vrbo&#x60;, … | [optional] |
| **message_id** | **String** | Repull message id, as &#x60;GET /v1/conversations/{id}/messages&#x60; returns it (&#x60;id&#x60;). | [optional] |
| **external_message_id** | **String** | The channel&#39;s own message id. Stable across retries and backfill: dedupe on it. | [optional] |
| **confirmation_code** | **String** | The reservation&#39;s confirmation code on the channel. &#x60;null&#x60; when there is no reservation. | [optional] |
| **from** | [**ReservationMessageReceivedPayloadFrom**](ReservationMessageReceivedPayloadFrom.md) |  | [optional] |
| **body** | **String** | Empty when the guest sent only a file. | [optional] |
| **sent_at** | **Time** | When the message was sent on the channel. | [optional] |
| **direction** | **String** | Always &#x60;inbound&#x60; on this event. | [optional] |
| **sender_type** | **String** | Sender role as stored, the same as &#x60;senderType&#x60; on &#x60;GET /v1/conversations/{id}/messages&#x60;. | [optional] |
| **sender_name** | **String** |  | [optional] |
| **sender_avatar** | **String** |  | [optional] |
| **translated_body** | **String** | English translation, when one has been computed. | [optional] |
| **attachments** | [**Array&lt;ConversationMessageAttachment&gt;**](ConversationMessageAttachment.md) | Files the guest sent (photos, videos, documents), same shape as &#x60;GET /v1/conversations/{id}/messages&#x60;. Empty array when there are none. | [optional] |
| **is_automated** | **Boolean** |  | [optional] |
| **ai_generated** | **Boolean** |  | [optional] |
| **status** | **String** | Stored delivery state. Usually &#x60;null&#x60; on inbound messages (&#x60;GET /v1/conversations/{id}/messages&#x60; shows them as &#x60;received&#x60;). | [optional] |
| **revision** | **Time** | Orders two deliveries about the same message without parsing the body. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageReceivedPayload.new(
  hotel_id: 10433861,
  reservation_id: 215906,
  thread_id: 532457,
  external_thread_id: 2603530383,
  listing_id: 5668,
  channel: airbnb,
  message_id: 1847801,
  external_message_id: 32837172376,
  confirmation_code: HMEXAMPLE1,
  from: null,
  body: Hi! What time can we check in?,
  sent_at: 2026-05-01T15:00Z,
  direction: null,
  sender_type: guest,
  sender_name: Alex Morgan,
  sender_avatar: null,
  translated_body: null,
  attachments: null,
  is_automated: null,
  ai_generated: null,
  status: null,
  revision: 2026-05-01T15:00Z
)
```

