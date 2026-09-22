# Repull::BookingPricingRateUpdateRestrictions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **min_stay** | **Integer** | Minimum length of stay. Booking.com stores a 1-night minimum as no minimum at all, so &#x60;minStay: 1&#x60; reads back as &#x60;0&#x60; and is reported as applied. | [optional] |
| **max_stay** | **Integer** | Maximum length of stay. | [optional] |
| **closed_to_arrival** | **Boolean** | Closed-to-arrival — guests may not check in on these nights. &#x60;false&#x60; clears the flag; omit the field to leave it as it is. | [optional] |
| **closed_to_departure** | **Boolean** | Closed-to-departure — guests may not check out on these nights. &#x60;false&#x60; clears the flag; omit the field to leave it as it is. | [optional] |
| **min_stay_arrival** | **Integer** | Arrival-based minimum length of stay — applies to stays that START on these nights, rather than any stay covering them. | [optional] |
| **max_stay_arrival** | **Integer** | Arrival-based maximum length of stay. | [optional] |
| **exact_stay_arrival** | **Integer** | Refused. Booking.com&#39;s restriction notification has no element for an exact arrival-based stay length, so it cannot be written through the API; sending it returns &#x60;422 restriction_not_supported&#x60; naming &#x60;updates[N].restrictions.exactStayArrival&#x60;. Set it on the rate plan in the Booking.com Extranet. | [optional] |
| **min_advance_res** | **String** | Refused, for the same reason as &#x60;exactStayArrival&#x60; — returns &#x60;422 restriction_not_supported&#x60;. Set the minimum advance-reservation window on the rate plan in the Booking.com Extranet. | [optional] |
| **max_advance_res** | **String** | Refused, for the same reason as &#x60;exactStayArrival&#x60; — returns &#x60;422 restriction_not_supported&#x60;. Set the maximum advance-reservation window on the rate plan in the Booking.com Extranet. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPricingRateUpdateRestrictions.new(
  min_stay: null,
  max_stay: null,
  closed_to_arrival: null,
  closed_to_departure: null,
  min_stay_arrival: null,
  max_stay_arrival: null,
  exact_stay_arrival: null,
  min_advance_res: null,
  max_advance_res: null
)
```

