# Repull::ReservationCancelledPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ReservationWebhookObject**](ReservationWebhookObject.md) |  |  |
| **cancelled_at** | **Time** | When the cancellation was recorded. | [optional] |
| **cancelled_by** | **String** | Who initiated the cancellation. | [optional] |
| **reason** | **String** | Free-form cancellation reason from the source channel, if available. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCancelledPayload.new(
  object: null,
  cancelled_at: 2026-05-01T14:00Z,
  cancelled_by: guest,
  reason: guest_requested
)
```

