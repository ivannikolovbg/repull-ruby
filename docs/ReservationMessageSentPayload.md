# Repull::ReservationMessageSentPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | Booking.com only: the hotel (property) id of the conversation&#39;s listing. Absent on other channels. A Booking.com Extranet login can cover several hotels, so use this to route the message. | [optional] |
| **reservation_id** | **Integer** |  | [optional] |
| **thread_id** | **String** | The Repull conversation id (numeric, as a string), for &#x60;GET /v1/conversations/{id}&#x60;. | [optional] |
| **external_thread_id** | **String** | The channel&#39;s own thread id. | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **message_id** | **String** | Repull message id, as &#x60;GET /v1/conversations/{id}/messages&#x60; returns it. | [optional] |
| **external_message_id** | **String** | The channel&#39;s own message id. Dedupe on it. | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **source** | **String** | &#x60;channel&#x60;: sent in the channel&#39;s own app (e.g. the Airbnb app). &#x60;repull&#x60;: sent through Repull — the API, the dashboard, an automation or AI. | [optional] |
| **from** | [**ReservationMessageSentPayloadFrom**](ReservationMessageSentPayloadFrom.md) |  | [optional] |
| **body** | **String** |  | [optional] |
| **sent_at** | **Time** |  | [optional] |
| **direction** | **String** |  | [optional] |
| **sender_type** | **String** | Sender role as stored, the same as on &#x60;GET /v1/conversations/{id}/messages&#x60; (&#x60;user&#x60; for a message sent through Repull). | [optional] |
| **sender_name** | **String** |  | [optional] |
| **sender_avatar** | **String** |  | [optional] |
| **translated_body** | **String** |  | [optional] |
| **attachments** | [**Array&lt;ConversationMessageAttachment&gt;**](ConversationMessageAttachment.md) |  | [optional] |
| **is_automated** | **Boolean** |  | [optional] |
| **ai_generated** | **Boolean** |  | [optional] |
| **status** | **String** | Delivery state: &#x60;sending&#x60;, &#x60;sent&#x60; or &#x60;failed&#x60;, as on &#x60;GET /v1/conversations/{id}/messages&#x60;. &#x60;null&#x60; for a message sent in the channel&#39;s app. | [optional] |
| **revision** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageSentPayload.new(
  hotel_id: 10433861,
  reservation_id: 235970,
  thread_id: 900301,
  external_thread_id: 2648057088,
  listing_id: 23893,
  channel: airbnb,
  message_id: 1854462,
  external_message_id: 32877308873,
  confirmation_code: HMJTFCEDFB,
  source: null,
  from: null,
  body: null,
  sent_at: null,
  direction: null,
  sender_type: host,
  sender_name: null,
  sender_avatar: null,
  translated_body: null,
  attachments: null,
  is_automated: null,
  ai_generated: null,
  status: sent,
  revision: null
)
```

