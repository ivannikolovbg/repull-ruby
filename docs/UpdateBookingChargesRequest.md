# Repull::UpdateBookingChargesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | Booking.com hotel/property id. |  |
| **charges** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | Full charge set to apply. |  |

## Example

```ruby
require 'repull'

instance = Repull::UpdateBookingChargesRequest.new(
  property_id: null,
  charges: null
)
```

