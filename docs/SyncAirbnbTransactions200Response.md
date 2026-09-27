# Repull::SyncAirbnbTransactions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **synced** | **Boolean** |  |  |
| **count** | **Integer** | Ledger lines written, Payout rows included. |  |
| **accounts** | [**Array&lt;SyncAirbnbTransactions200ResponseAccountsInner&gt;**](SyncAirbnbTransactions200ResponseAccountsInner.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::SyncAirbnbTransactions200Response.new(
  synced: null,
  count: null,
  accounts: null
)
```

