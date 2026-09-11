# Repull::SyncAirbnbTransactionsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Inclusive lower bound on transaction date. | [optional] |
| **end_date** | **Date** | Inclusive upper bound on transaction date. | [optional] |
| **transaction_type** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SyncAirbnbTransactionsRequest.new(
  start_date: null,
  end_date: null,
  transaction_type: null
)
```

