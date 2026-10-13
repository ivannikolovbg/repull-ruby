# Repull::ReservationMessageReceivedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | Booking.com only: the hotel (property) id of the conversation&#39;s listing. Absent on other channels. A Booking.com Extranet login can cover several hotels, so use this to route the message. | [optional] |
| **reservation_id** | **Integer** |  | [optional] |
| **thread_id** | **String** |  | [optional] |
| **from** | [**ReservationMessageReceivedPayloadFrom**](ReservationMessageReceivedPayloadFrom.md) |  | [optional] |
| **body** | **String** | Empty when the guest sent only a file. | [optional] |
| **sent_at** | **Time** |  | [optional] |
| **attachments** | [**Array&lt;ConversationMessageAttachment&gt;**](ConversationMessageAttachment.md) | Files the guest sent (photos, videos, documents), same shape as &#x60;GET /v1/conversations/{id}/messages&#x60;. Empty array when there are none. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageReceivedPayload.new(
  hotel_id: 10433861,
  reservation_id: 215906,
  thread_id: thr_01HX5XPQ2K,
  from: null,
  body: Hi! What time can we check in?,
  sent_at: 2026-05-01T15:00Z,
  attachments: null
)
```

