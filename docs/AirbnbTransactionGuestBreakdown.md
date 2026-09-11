# Repull::AirbnbTransactionGuestBreakdown

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total_paid** | **Float** |  |  |
| **service_fee_base** | **Float** |  | [optional] |
| **service_fee_vat** | **Float** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbTransactionGuestBreakdown.new(
  total_paid: null,
  service_fee_base: null,
  service_fee_vat: null
)
```

