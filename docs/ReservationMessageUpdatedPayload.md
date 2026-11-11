# Repull::ReservationMessageUpdatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | Booking.com only: the hotel (property) id of the conversation&#39;s listing. Absent on other channels. A Booking.com Extranet login can cover several hotels, so use this to route the message. | [optional] |
| **reservation_id** | **Integer** |  | [optional] |
| **thread_id** | **String** | The Repull conversation id (numeric, as a string), for &#x60;GET /v1/conversations/{id}&#x60;. | [optional] |
| **external_thread_id** | **String** |  | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **message_id** | **String** |  | [optional] |
| **external_message_id** | **String** |  | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **from** | [**ReservationMessageUpdatedPayloadFrom**](ReservationMessageUpdatedPayloadFrom.md) |  | [optional] |
| **body** | **String** | The text after the edit. | [optional] |
| **previous_body** | **String** | The text before the edit. | [optional] |
| **edited_at** | **Time** | When the edit was made, as the channel reports it. Also the event&#39;s &#x60;revision&#x60;. | [optional] |
| **sent_at** | **Time** | When the message was first sent. | [optional] |
| **direction** | **String** |  | [optional] |
| **sender_type** | **String** |  | [optional] |
| **sender_name** | **String** |  | [optional] |
| **sender_avatar** | **String** |  | [optional] |
| **translated_body** | **String** |  | [optional] |
| **attachments** | [**Array&lt;ConversationMessageAttachment&gt;**](ConversationMessageAttachment.md) |  | [optional] |
| **is_automated** | **Boolean** |  | [optional] |
| **ai_generated** | **Boolean** |  | [optional] |
| **status** | **String** |  | [optional] |
| **revision** | **Time** | Same as &#x60;editedAt&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageUpdatedPayload.new(
  hotel_id: 10433861,
  reservation_id: 235970,
  thread_id: 900301,
  external_thread_id: 2648057088,
  listing_id: 23893,
  channel: airbnb,
  message_id: 1854462,
  external_message_id: 32877308873,
  confirmation_code: HMJTFCEDFB,
  from: null,
  body: null,
  previous_body: null,
  edited_at: null,
  sent_at: null,
  direction: null,
  sender_type: null,
  sender_name: null,
  sender_avatar: null,
  translated_body: null,
  attachments: null,
  is_automated: null,
  ai_generated: null,
  status: null,
  revision: null
)
```

