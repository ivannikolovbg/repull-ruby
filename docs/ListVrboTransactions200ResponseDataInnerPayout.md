# Repull::ListVrboTransactions200ResponseDataInnerPayout

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payout_id** | **String** |  | [optional] |
| **payout_date** | **Date** |  | [optional] |
| **line_index** | **Integer** |  | [optional] |
| **paid_out_amount** | **Float** |  | [optional] |
| **bank_destination** | **String** | The bank account, as Vrbo shows it (masked). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListVrboTransactions200ResponseDataInnerPayout.new(
  payout_id: null,
  payout_date: null,
  line_index: null,
  paid_out_amount: null,
  bank_destination: null
)
```

