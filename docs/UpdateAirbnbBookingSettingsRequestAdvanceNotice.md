# Repull::UpdateAirbnbBookingSettingsRequestAdvanceNotice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hours** | **Integer** | Counted back from 11:59 PM on the check-in day (listing time): &#x60;0&#x60; &#x3D; same-day bookings until midnight, &#x60;1&#x60; &#x3D; until 11 PM, &#x60;24&#x60; &#x3D; no same-day bookings. | [optional] |
| **same_day_cutoff** | **String** | The last time a same-day booking is accepted, whole hours in the listing&#39;s time (&#x60;23:00&#x60; &#x3D; 11 PM, &#x60;00:00&#x60; &#x3D; midnight). Converted to &#x60;hours&#x60; (&#x60;23:00&#x60; &#x3D; 1). | [optional] |
| **allow_request_to_book** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbBookingSettingsRequestAdvanceNotice.new(
  hours: null,
  same_day_cutoff: 23:00,
  allow_request_to_book: null
)
```

