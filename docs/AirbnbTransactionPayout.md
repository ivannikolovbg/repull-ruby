# Repull::AirbnbTransactionPayout

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payout_id** | **String** |  |  |
| **payout_date** | **Date** | Settlement date (populated on Payout-type rows). |  |
| **paid_out_amount** | **Float** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbTransactionPayout.new(
  payout_id: null,
  payout_date: null,
  paid_out_amount: null
)
```

