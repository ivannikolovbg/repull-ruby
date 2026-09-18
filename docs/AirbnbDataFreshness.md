# Repull::AirbnbDataFreshness

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **last_synced_at** | **Time** | The most recent Airbnb import COMPLETED by any account in scope. &#x60;null&#x60; when none of them ever has. A run that failed or was rate-limited does not move it. |  |
| **stale** | **Boolean** | &#x60;true&#x60; only when EVERY connected Airbnb account is stale — nothing in this response can be trusted to be current. With one account (the common case) that is the same as it has always been. With several, one disconnected host no longer condemns the other&#39;s rows: &#x60;stale&#x60; stays &#x60;false&#x60; and &#x60;reason&#x60; becomes &#x60;partial_account_staleness&#x60;. Read &#x60;accounts[]&#x60; for which is which. |  |
| **reason** | **String** | Why the data is stale. One of &#x60;host_disconnected_since_&lt;iso&gt;&#x60;, &#x60;host_not_activated&#x60;, &#x60;sync_lag_&gt;_24h&#x60;, &#x60;never_synced&#x60;, &#x60;host_disconnected&#x60;, or &#x60;partial_account_staleness&#x60;. The last one appears WITH &#x60;stale: false&#x60;: the response is usable, but at least one connected account needs attention — deliberately surfaced so a consumer reading only the aggregate is never told everything is fine while an account is down. | [optional] |
| **fix_url** | **String** | Dashboard URL the consumer can open to resolve the staleness (the Airbnb connections screen). Present whenever &#x60;reason&#x60; is, including on &#x60;partial_account_staleness&#x60;. | [optional] |
| **accounts** | [**Array&lt;AirbnbAccountFreshness&gt;**](AirbnbAccountFreshness.md) | Per-account freshness, sorted by &#x60;accountId&#x60;. Omitted on responses that have no connected account to attribute (e.g. a workspace that has never connected Airbnb). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbDataFreshness.new(
  last_synced_at: null,
  stale: null,
  reason: null,
  fix_url: null,
  accounts: null
)
```

