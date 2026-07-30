# Repull::AcknowledgeBookingReservationsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_ids** | **Array&lt;String&gt;** | Booking.com reservation ids to acknowledge. |  |

## Example

```ruby
require 'repull'

instance = Repull::AcknowledgeBookingReservationsRequest.new(
  reservation_ids: null
)
```

