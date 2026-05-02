# Repull::BookingPricingRateUpdateRestrictions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **min_stay** | **Integer** |  | [optional] |
| **max_stay** | **Integer** |  | [optional] |
| **closed_to_arrival** | **Boolean** |  | [optional] |
| **closed_to_departure** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPricingRateUpdateRestrictions.new(
  min_stay: null,
  max_stay: null,
  closed_to_arrival: null,
  closed_to_departure: null
)
```

