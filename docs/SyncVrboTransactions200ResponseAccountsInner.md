# Repull::SyncVrboTransactions200ResponseAccountsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  | [optional] |
| **count** | **Integer** |  | [optional] |
| **payouts** | **Integer** |  | [optional] |
| **upcoming** | **Integer** |  | [optional] |
| **error** | [**SyncVrboTransactions200ResponseAccountsInnerError**](SyncVrboTransactions200ResponseAccountsInnerError.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SyncVrboTransactions200ResponseAccountsInner.new(
  account_id: null,
  count: null,
  payouts: null,
  upcoming: null,
  error: null
)
```

