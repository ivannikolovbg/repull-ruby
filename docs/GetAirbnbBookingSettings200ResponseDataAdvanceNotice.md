# Repull::GetAirbnbBookingSettings200ResponseDataAdvanceNotice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hours** | **Integer** | Whole hours of notice. &#x60;0&#x60; allows same-day bookings. | [optional] |
| **same_day_bookings_allowed** | **Boolean** | Derived: &#x60;hours &#x3D;&#x3D;&#x3D; 0&#x60;. | [optional] |
| **allow_request_to_book** | **Boolean** | Whether a guest may still REQUEST to book inside the notice window. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbBookingSettings200ResponseDataAdvanceNotice.new(
  hours: null,
  same_day_bookings_allowed: null,
  allow_request_to_book: null
)
```

