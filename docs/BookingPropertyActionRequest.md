# Repull::BookingPropertyActionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** | &#x60;unlist&#x60; closes the room&#39;s availability across the whole forward window, so the property stops selling. &#x60;relist&#x60; re-syncs the real calendar: dates that are genuinely blocked (a reservation, an owner stay) stay blocked, and only the closure &#x60;unlist&#x60; wrote lifts. They are not mirror images, and that is deliberate. |  |
| **hotel_id** | **String** | Booking.com property to act on, for a listing mapped to more than one. Without it the request is refused with &#x60;409 ambiguous_booking_mapping&#x60; and nothing is written. &#x60;?hotel_id&#x3D;&#x60; means the same thing; the body wins if you send both. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPropertyActionRequest.new(
  action: null,
  hotel_id: null
)
```

