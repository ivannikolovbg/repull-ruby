# Repull::BookingOccupancyRule

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **persons** | **Integer** | The party size this rule prices. Must differ from &#x60;leadingOccupancy&#x60; and be no more than the room holds. |  |
| **additional** | **Float** | Signed amount added to the leading-occupancy price, in the rate plan&#39;s currency. &#x60;-12.01&#x60; &#x3D; 12.01 less. | [optional] |
| **percentage** | **Float** | Signed percent change from the leading-occupancy price. &#x60;-10&#x60; &#x3D; 10% less, &#x60;5&#x60; &#x3D; 5% more. (Booking.com&#39;s own feeds show the result as a multiplier, &#x60;90.0&#x60;; Repull reads it back as &#x60;-10&#x60;.) | [optional] |
| **round** | **Boolean** | Ask Booking.com to round the derived price. Default &#x60;false&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingOccupancyRule.new(
  persons: 2,
  additional: -12.01,
  percentage: null,
  round: null
)
```

