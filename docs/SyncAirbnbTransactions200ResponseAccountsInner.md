# Repull::SyncAirbnbTransactions200ResponseAccountsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Airbnb host id. |  |
| **count** | **Integer** |  |  |
| **payouts** | **Integer** | Payouts in the refreshed window. |  |
| **upcoming_removed** | **Integer** | UPCOMING lines Airbnb no longer lists (paid out or cancelled) and were removed. |  |
| **error** | [**SyncAirbnbTransactions200ResponseAccountsInnerError**](SyncAirbnbTransactions200ResponseAccountsInnerError.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SyncAirbnbTransactions200ResponseAccountsInner.new(
  account_id: null,
  count: null,
  payouts: null,
  upcoming_removed: null,
  error: null
)
```

