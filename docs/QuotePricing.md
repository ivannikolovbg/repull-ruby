# Repull::QuotePricing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nightly_total** | **Float** |  | [optional] |
| **length_of_stay_discount** | **Float** |  | [optional] |
| **length_of_stay_discount_percent** | **Float** |  | [optional] |
| **cleaning_fee** | **Float** |  | [optional] |
| **pet_fee** | **Float** |  | [optional] |
| **other_fees** | **Float** |  | [optional] |
| **taxes** | **Float** |  | [optional] |
| **total** | **Float** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::QuotePricing.new(
  nightly_total: null,
  length_of_stay_discount: null,
  length_of_stay_discount_percent: null,
  cleaning_fee: null,
  pet_fee: null,
  other_fees: null,
  taxes: null,
  total: null
)
```

