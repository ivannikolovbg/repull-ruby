# Repull::GetAirbnbListingFees200ResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **fee_type** | **String** |  | [optional] |
| **amount** | **Float** |  | [optional] |
| **amount_type** | **String** |  | [optional] |
| **charge_type** | **String** |  | [optional] |
| **charge_period** | **String** |  | [optional] |
| **offline** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbListingFees200ResponseDataInner.new(
  fee_type: PASS_THROUGH_CLEANING_FEE,
  amount: null,
  amount_type: null,
  charge_type: null,
  charge_period: null,
  offline: null
)
```

