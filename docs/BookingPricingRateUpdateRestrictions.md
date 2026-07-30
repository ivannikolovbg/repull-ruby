# Repull::BookingPricingRateUpdateRestrictions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **min_stay** | **Integer** | Minimum length of stay (&#x60;minimumstay&#x60;). | [optional] |
| **max_stay** | **Integer** | Maximum length of stay (&#x60;maximumstay&#x60;). | [optional] |
| **closed_to_arrival** | **Boolean** | Closed-to-arrival — guests may not check in on the affected dates (&#x60;closedonarrival&#x60;). | [optional] |
| **closed_to_departure** | **Boolean** | Closed-to-departure — guests may not check out on the affected dates (&#x60;closedondeparture&#x60;). | [optional] |
| **min_stay_arrival** | **Integer** | Arrival-based minimum length of stay (&#x60;minimumstay_arrival&#x60;). | [optional] |
| **max_stay_arrival** | **Integer** | Arrival-based maximum length of stay (&#x60;maximumstay_arrival&#x60;). | [optional] |
| **exact_stay_arrival** | **Integer** | Arrival-based exact length of stay (&#x60;exactstay_arrival&#x60;). | [optional] |
| **min_advance_res** | **String** | Minimum advance-reservation window, format &#x60;XDY&#x60; (X days Y hours) — &#x60;min_advance_res&#x60;. | [optional] |
| **max_advance_res** | **String** | Maximum advance-reservation window, format &#x60;XDY&#x60; (X days Y hours) — &#x60;max_advance_res&#x60;. | [optional] |

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

