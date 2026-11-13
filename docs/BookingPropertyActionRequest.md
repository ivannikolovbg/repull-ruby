# Repull::BookingPropertyActionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** | &#x60;unlist&#x60; closes the room&#39;s availability across the whole forward window, so the property stops selling. &#x60;relist&#x60; re-syncs the real calendar: dates that are genuinely blocked (a reservation, an owner stay) stay blocked, and only the closure &#x60;unlist&#x60; wrote lifts. They are not mirror images, and that is deliberate.  &#x60;open&#x60; runs Booking.com&#39;s readiness check and opens the property only if it passes — on a property that is not ready it changes nothing and answers &#x60;422 booking_rejected&#x60; with Booking.com&#39;s reasons in &#x60;blockers&#x60;. It opens a property Booking.com has in a build stage (&#x60;XML: Being built&#x60;, &#x60;XML: Ready to open&#x60;) or closed. &#x60;close&#x60; closes the property on Booking.com with &#x60;reason&#x60;. |  |
| **reason** | **String** | &#x60;close&#x60; only: the reason Booking.com records for closing the property. Default &#x60;PROPERTY_NOT_AVAILABLE&#x60;. | [optional] |
| **hotel_id** | **String** | Booking.com property to act on, for a listing mapped to more than one. Without it the request is refused with &#x60;409 ambiguous_booking_mapping&#x60; and nothing is written. &#x60;?hotel_id&#x3D;&#x60; means the same thing; the body wins if you send both. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPropertyActionRequest.new(
  action: null,
  reason: null,
  hotel_id: null
)
```

