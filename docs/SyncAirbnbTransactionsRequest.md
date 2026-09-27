# Repull::SyncAirbnbTransactionsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Inclusive lower bound (YYYY-MM-DD). | [optional] |
| **end_date** | **Date** | Inclusive upper bound (YYYY-MM-DD). | [optional] |
| **transaction_type** | **String** | Refresh only settled or only upcoming lines. Both when omitted. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SyncAirbnbTransactionsRequest.new(
  start_date: null,
  end_date: null,
  transaction_type: null
)
```

