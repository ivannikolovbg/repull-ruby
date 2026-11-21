# Repull::SyncVrboTransactions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **synced** | **Boolean** |  | [optional] |
| **count** | **Integer** |  | [optional] |
| **accounts** | [**Array&lt;SyncVrboTransactions200ResponseAccountsInner&gt;**](SyncVrboTransactions200ResponseAccountsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SyncVrboTransactions200Response.new(
  synced: null,
  count: null,
  accounts: null
)
```

