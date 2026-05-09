# Repull::AirbnbDataFreshness

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **last_synced_at** | **Time** | Most recent sync timestamp across the rows in the response. &#x60;null&#x60; when nothing has ever synced for this customer. |  |
| **stale** | **Boolean** | &#x60;true&#x60; when any host is disconnected, when the local cache is empty, or when the cache hasn&#39;t been refreshed in 24h+. &#x60;false&#x60; when hosts are healthy and sync is fresh. |  |
| **reason** | **String** | Why the data is stale. One of &#x60;host_disconnected_since_&lt;iso&gt;&#x60;, &#x60;sync_lag_&gt;_24h&#x60;, &#x60;never_synced&#x60;. Omitted when &#x60;stale&#x60; is &#x60;false&#x60;. | [optional] |
| **fix_url** | **String** | Dashboard URL the consumer can open to resolve the staleness (typically the Airbnb reconnect screen). Omitted when &#x60;stale&#x60; is &#x60;false&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbDataFreshness.new(
  last_synced_at: null,
  stale: null,
  reason: null,
  fix_url: null
)
```

