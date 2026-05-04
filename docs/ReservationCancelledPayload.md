# Repull::ReservationCancelledPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **cancelled_at** | **Time** |  | [optional] |
| **cancelled_by** | **String** | Who initiated the cancellation (guest, host, platform). | [optional] |
| **reason** | **String** |  | [optional] |
| **refund** | [**ReservationCancelledPayloadRefund**](ReservationCancelledPayloadRefund.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCancelledPayload.new(
  id: 215906,
  confirmation_code: HMA1234567,
  cancelled_at: 2026-05-01T14:00Z,
  cancelled_by: guest,
  reason: guest_requested,
  refund: null
)
```

