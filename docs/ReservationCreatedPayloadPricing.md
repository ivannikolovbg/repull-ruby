# Repull::ReservationCreatedPayloadPricing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **subtotal** | **String** |  | [optional] |
| **taxes** | **String** |  | [optional] |
| **total** | **String** |  | [optional] |
| **currency** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCreatedPayloadPricing.new(
  subtotal: 1200.00,
  taxes: 120.00,
  total: 1320.00,
  currency: USD
)
```

