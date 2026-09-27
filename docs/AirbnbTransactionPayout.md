# Repull::AirbnbTransactionPayout

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payout_id** | **String** | The payout this line was settled in (its own id on a Payout row). &#x60;null&#x60; on an UPCOMING line. |  |
| **payout_id_synthetic** | **Boolean** | &#x60;true&#x60; when Airbnb sent no payout id (a payout netting to $0.00) and Repull derived a stable one. |  |
| **payout_date** | **Date** |  |  |
| **line_index** | **Integer** | Position within the payout, from 1. &#x60;null&#x60; on the Payout row and on UPCOMING lines. |  |
| **paid_out_amount** | **Float** | On the Payout row only: the amount paid out. Its lines sum to it. |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbTransactionPayout.new(
  payout_id: M-HQLLNSWKUWK7R,
  payout_id_synthetic: null,
  payout_date: null,
  line_index: null,
  paid_out_amount: null
)
```

