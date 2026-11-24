# Repull::Connection

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **provider** | **String** |  | [optional] |
| **status** | **String** | &#x60;active&#x60; — connected and working. &#x60;pending&#x60; — still settling. &#x60;needs_permissions&#x60; — connected but the host must grant more access before it works (see &#x60;action&#x60;/&#x60;fixUrl&#x60;). An &#x60;active&#x60; connection can also carry an &#x60;action&#x60; (e.g. a Smoobu legacy API key that must be replaced with a key + secret before October 31, 2026). &#x60;error&#x60; — the last operation failed. &#x60;disconnected&#x60; — revoked or superseded. | [optional] |
| **external_account_id** | **String** | The platform&#39;s own account id: Airbnb host id; Booking.com hotel id (&#x60;booking&#x60;); the Booking.com account id behind the Extranet login (&#x60;booking_extranet&#x60;); Vrbo&#39;s account id (&#x60;vrbo&#x60;); the PMS&#39;s own account or company id. &#x60;null&#x60; when the platform id is not known yet (a Vrbo sign-in before its account id is captured, a PMS that does not expose one); never a Repull id. Use &#x60;id&#x60; for our record. | [optional] |
| **access_type** | [**ConnectionAccessType**](ConnectionAccessType.md) | What this connection may do: &#x60;read_only&#x60;, &#x60;messaging&#x60; or &#x60;full_access&#x60; (see &#x60;ConnectionAccessType&#x60; for the meaning per provider). Airbnb: the tier of the host in &#x60;externalAccountId&#x60;. &#x60;null&#x60; when unknown. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **host** | [**ConnectHost**](ConnectHost.md) | Host metadata for the linked account. Currently populated for Airbnb only; null for other providers. | [optional] |
| **action** | [**ConnectionAction**](ConnectionAction.md) | Set when the host must do something before the connection works (e.g. grant the invited Booking.com Extranet user full access), or has units still to map (&#x60;reason: needs_mapping&#x60; — Booking.com Extranet rooms, Vrbo units; &#x60;required&#x60; is false when only some Vrbo units are left). &#x60;null&#x60; when no action is pending. | [optional] |
| **fix_url** | **String** | Durable link that reopens the hosted Connect flow bound to this account on the fix screen — send the host here to resolve &#x60;action&#x60;. For &#x60;needs_mapping&#x60; it opens the unit mapping directly (no new sign-in). Present whenever &#x60;action&#x60; is set; &#x60;null&#x60; otherwise. | [optional] |
| **import** | [**AccountImport**](AccountImport.md) | The account&#39;s latest import — &#x60;status: running&#x60; while the first sync (or a later one) is going, then &#x60;completed&#x60; or &#x60;failed&#x60;. &#x60;null&#x60; when no import has been recorded. The same run is announced by the &#x60;account.import.*&#x60; webhooks; the history is on &#x60;GET /v1/connections/{id}/imports&#x60;. | [optional] |
| **scope** | **String** | Apps (&#x60;pricelabs&#x60;) only. &#x60;workspace&#x60;: every listing of the workspace, including listings added later. &#x60;listings&#x60;: only &#x60;listingIds&#x60;. | [optional] |
| **listing_ids** | **Array&lt;String&gt;** | Apps only: the listings a &#x60;listings&#x60;-scoped connection covers; &#x60;null&#x60; for &#x60;workspace&#x60;. | [optional] |
| **listing_count** | **Integer** | Apps only: listings the connection covers now. | [optional] |
| **key_masked** | **String** | Apps only: the key the app uses, masked. The key itself is shown once, when created. | [optional] |
| **label** | **String** | Apps only: the name given to the key. | [optional] |
| **disconnected_at** | **Time** | Apps only: when the connection was revoked. | [optional] |
| **health** | [**AppConnectionHealth**](AppConnectionHealth.md) | Apps only: how the app is doing on this connection. &#x60;null&#x60; once disconnected. | [optional] |
| **webhook** | [**HospitableWebhook**](HospitableWebhook.md) | Hospitable only: the webhook URL the host pastes into Hospitable (Apps → Webhooks → + Add new) and whether deliveries are arriving. Show it in your own UI so the host can set it up. Absent for other providers. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Connection.new(
  id: null,
  provider: hostaway,
  status: active,
  external_account_id: 20123456,
  access_type: null,
  created_at: null,
  host: null,
  action: null,
  fix_url: null,
  import: null,
  scope: null,
  listing_ids: null,
  listing_count: 12,
  key_masked: sk_live_4eB3...XYZw,
  label: null,
  disconnected_at: null,
  health: null,
  webhook: null
)
```

