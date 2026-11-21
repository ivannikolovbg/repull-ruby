# Repull::GetVrboReservation200ResponseDataFreshness

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **last_synced_at** | **String** |  | [optional] |
| **stale** | **Boolean** |  | [optional] |
| **reason** | **String** |  | [optional] |
| **source** | **String** |  | [optional] |
| **accounts** | [**Array&lt;GetVrboReservation200ResponseDataFreshnessAccountsInner&gt;**](GetVrboReservation200ResponseDataFreshnessAccountsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboReservation200ResponseDataFreshness.new(
  last_synced_at: null,
  stale: null,
  reason: null,
  source: null,
  accounts: null
)
```

