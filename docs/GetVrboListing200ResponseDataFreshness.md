# Repull::GetVrboListing200ResponseDataFreshness

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **last_synced_at** | **String** |  | [optional] |
| **stale** | **Boolean** |  | [optional] |
| **reason** | **String** |  | [optional] |
| **fix_url** | **String** |  | [optional] |
| **accounts** | [**Array&lt;GetVrboListing200ResponseDataFreshnessAccountsInner&gt;**](GetVrboListing200ResponseDataFreshnessAccountsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListing200ResponseDataFreshness.new(
  last_synced_at: null,
  stale: null,
  reason: null,
  fix_url: null,
  accounts: null
)
```

