# Repull::ReservationCancelledPayloadRefund

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | **String** |  | [optional] |
| **currency** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCancelledPayloadRefund.new(
  amount: 1320.00,
  currency: USD
)
```

