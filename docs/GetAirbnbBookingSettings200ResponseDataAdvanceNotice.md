# Repull::GetAirbnbBookingSettings200ResponseDataAdvanceNotice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hours** | **Integer** | Airbnb&#39;s advance notice: 0-24, 48, 72 or 168. Airbnb counts it back from 11:59 PM on the check-in day, in the listing&#39;s time zone, so 0-23 is a same-day cutoff: &#x60;0&#x60; &#x3D; same-day bookings until midnight, &#x60;1&#x60; &#x3D; until 11 PM, &#x60;3&#x60; &#x3D; until 9 PM. &#x60;24&#x60; and above &#x3D; no same-day bookings. | [optional] |
| **same_day_bookings_allowed** | **Boolean** | Derived: &#x60;hours &lt; 24&#x60;. | [optional] |
| **same_day_cutoff** | **String** | Derived: the last time a same-day booking is accepted, &#x60;HH:mm&#x60; in the listing&#39;s time (&#x60;00:00&#x60; &#x3D; midnight). &#x60;null&#x60; when same-day bookings are off. | [optional] |
| **allow_request_to_book** | **Boolean** | Whether a guest may still REQUEST to book inside the notice window. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbBookingSettings200ResponseDataAdvanceNotice.new(
  hours: null,
  same_day_bookings_allowed: null,
  same_day_cutoff: 23:00,
  allow_request_to_book: null
)
```

