# Repull::ReservationMessageReceivedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_id** | **Integer** |  | [optional] |
| **thread_id** | **String** |  | [optional] |
| **from** | [**ReservationMessageReceivedPayloadFrom**](ReservationMessageReceivedPayloadFrom.md) |  | [optional] |
| **body** | **String** |  | [optional] |
| **sent_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageReceivedPayload.new(
  reservation_id: 215906,
  thread_id: thr_01HX5XPQ2K,
  from: null,
  body: Hi! What time can we check in?,
  sent_at: 2026-05-01T15:00Z
)
```

