# Repull::ConnectStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **connected** | **Boolean** |  | [optional] |
| **provider** | **String** |  | [optional] |
| **id** | **String** | Repull-side connection ID. Stable across token refreshes. | [optional] |
| **status** | **String** |  | [optional] |
| **external_account_id** | **String** | Provider-side account ID (e.g. the Airbnb host ID). | [optional] |
| **created_at** | **Time** |  | [optional] |
| **host** | [**ConnectHost**](ConnectHost.md) | Host metadata, populated for Airbnb when the host row exists. Null for other providers (per-provider enrichment is incremental). | [optional] |
| **accounts** | [**Array&lt;ConnectStatusAccountsInner&gt;**](ConnectStatusAccountsInner.md) | Airbnb: every Airbnb account this workspace has connected, including ones since disconnected. Pass &#x60;externalAccountId&#x60; as &#x60;accountId&#x60; to &#x60;DELETE /v1/connect/airbnb&#x60; to disconnect one account. Vrbo (&#x60;GET /v1/connect/vrbo-login&#x60;): every signed-in Vrbo account, each with &#x60;accessType&#x60; and &#x60;import&#x60; (a &#x60;VrboImportStatus&#x60;), plus a top-level &#x60;dataFreshness&#x60;. | [optional] |
| **write_policy** | [**PmsWritePolicy**](PmsWritePolicy.md) | PMS connections only: what the app may change in the PMS. Change it with &#x60;PATCH /v1/connect/{provider}/write-policy&#x60;. | [optional] |
| **capabilities** | [**ConnectStatusCapabilities**](ConnectStatusCapabilities.md) |  | [optional] |
| **data_freshness** | **Object** | Vrbo only: the same freshness envelope the Airbnb read endpoints return, per account and in aggregate. Its reason is never_synced until a mapping is confirmed and importing while upcoming bookings come in. | [optional] |
| **action** | [**ConnectionAction**](ConnectionAction.md) | Smoobu only: set to &#x60;{ required: true, reason: \&quot;reauth_required\&quot;, message }&#x60; when the connection still uses a legacy single API key, which Smoobu stops accepting on October 31, 2026. &#x60;null&#x60; once it is on an API key + secret. | [optional] |
| **fix_url** | **String** | Smoobu only: durable link to the hosted Smoobu form where the host pastes a new API key + secret. Submitting it updates this same connection (&#x60;id&#x60; unchanged). Present only when &#x60;action.required&#x60; is true. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectStatus.new(
  connected: true,
  provider: airbnb,
  id: 3,
  status: active,
  external_account_id: 10000001,
  created_at: null,
  host: null,
  accounts: null,
  write_policy: null,
  capabilities: null,
  data_freshness: null,
  action: null,
  fix_url: null
)
```

