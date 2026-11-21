# Repull::GetVrboListingAdditionalInfo200ResponseDataFreshness

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **last_synced_at** | **Time** | When this data was read from Vrbo. |  |
| **stale** | **Boolean** |  |  |
| **reason** | **String** | &#x60;refreshing&#x60;: the copy is over 24 h old and is being refreshed now — the next read has the new one. &#x60;reconnect_required&#x60;: Vrbo signed the account out; reconnect it (&#x60;fixUrl&#x60;). |  |
| **fix_url** | **String** |  | [optional] |
| **source** | **String** | &#x60;stored&#x60;: Repull&#39;s copy. &#x60;live&#x60;: read from Vrbo for this request. |  |
| **accounts** | [**Array&lt;GetVrboListingAdditionalInfo200ResponseDataFreshnessAccountsInner&gt;**](GetVrboListingAdditionalInfo200ResponseDataFreshnessAccountsInner.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingAdditionalInfo200ResponseDataFreshness.new(
  last_synced_at: null,
  stale: null,
  reason: null,
  fix_url: null,
  source: null,
  accounts: null
)
```

