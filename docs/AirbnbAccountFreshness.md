# Repull::AirbnbAccountFreshness

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Airbnb host id, as a string (they exceed 2^53). The same value &#x60;?account_id&#x3D;&#x60; accepts and &#x60;GET /v1/connect/airbnb&#x60; returns as &#x60;accounts[].externalAccountId&#x60;. |  |
| **account_name** | **String** | Display name of the connected account. | [optional] |
| **last_synced_at** | **Time** | When this account last COMPLETED an Airbnb import. &#x60;null&#x60; when it never has. A run that failed or was rate-limited does not move it. |  |
| **stale** | **Boolean** | &#x60;true&#x60; when this account is disconnected, has never synced, or has not refreshed in 24h+. |  |
| **reason** | **String** | Why THIS account is stale. Omitted when it is fresh. | [optional] |
| **fix_url** | **String** | Where to reconnect this account. Omitted when it is fresh. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbAccountFreshness.new(
  account_id: 1772489413932732258,
  account_name: Pomello,
  last_synced_at: null,
  stale: null,
  reason: null,
  fix_url: null
)
```

