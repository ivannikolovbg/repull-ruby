# Repull::ConnectStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **connected** | **Boolean** |  | [optional] |
| **provider** | **String** |  | [optional] |
| **id** | **String** | Repull-side connection ID (the &#x60;X-Account-Id&#x60;). Stable across token refreshes. | [optional] |
| **connection_id** | **String** | Same as &#x60;id&#x60;: our connection record. | [optional] |
| **status** | **String** |  | [optional] |
| **external_account_id** | **String** | The platform&#39;s own account id: Airbnb host id; Booking.com hotel id (&#x60;booking&#x60;); the Booking.com account id behind the Extranet login (&#x60;booking_extranet&#x60;); Vrbo&#39;s account id (&#x60;vrbo&#x60;); the PMS&#39;s own account or company id. &#x60;null&#x60; when the platform id is not known yet (a Vrbo sign-in before its account id is captured, a PMS that does not expose one); never a Repull id. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **host** | [**ConnectHost**](ConnectHost.md) | Host metadata, populated for Airbnb when the host row exists. Null for other providers (per-provider enrichment is incremental). | [optional] |
| **accounts** | [**Array&lt;ConnectStatusAccountsInner&gt;**](ConnectStatusAccountsInner.md) | Airbnb: every Airbnb account this workspace has connected, including ones since disconnected. Pass &#x60;externalAccountId&#x60; as &#x60;accountId&#x60; to &#x60;DELETE /v1/connect/airbnb&#x60; to disconnect one account. Vrbo (&#x60;GET /v1/connect/vrbo-login&#x60;): every signed-in Vrbo account, each with &#x60;accessType&#x60; and &#x60;import&#x60; (a &#x60;VrboImportStatus&#x60;), plus a top-level &#x60;dataFreshness&#x60;. &#x60;externalAccountId&#x60; is the platform&#39;s own id (Airbnb host id, Vrbo account id; &#x60;null&#x60; for a Vrbo sign-in whose account id is not captured yet) and &#x60;connectionId&#x60; our connection record. | [optional] |
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
  connection_id: 3,
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

