# Repull::AccountDisconnectedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** |  | [optional] |
| **account_id** | **String** | The disconnected account&#39;s &#x60;externalAccountId&#x60; — the platform&#39;s own account id: Airbnb host id; Booking.com hotel id (&#x60;booking&#x60;); the Booking.com account id behind the Extranet login (&#x60;booking_extranet&#x60;); Vrbo&#39;s account id (&#x60;vrbo&#x60;); the PMS&#39;s own account or company id. &#x60;null&#x60; when the platform id is not known yet (a Vrbo sign-in before its account id is captured, a PMS that does not expose one); never a Repull id. | [optional] |
| **connection_id** | **String** | Our connection record id: the &#x60;X-Account-Id&#x60; value, the same as &#x60;account.id&#x60;. &#x60;null&#x60; only when the account has no connection record (e.g. a Vrbo sign-in in a workspace with no Vrbo connection). A string in this event. | [optional] |
| **provider** | **String** | Channel or PMS id: &#x60;airbnb&#x60;, &#x60;booking_extranet&#x60;, &#x60;vrbo&#x60;, or the PMS (&#x60;hostaway&#x60;, &#x60;guesty&#x60;, &#x60;smoobu&#x60;, …). | [optional] |
| **disconnected_at** | **Time** |  | [optional] |
| **reason** | **String** | Why the connection was lost. &#x60;refresh_token_rejected&#x60; — upstream OAuth refresh endpoint returned a hard rejection. &#x60;manual_disconnect&#x60; — host/admin disconnected via the dashboard. &#x60;auth_expired&#x60; — the saved credentials stopped working: an Extranet or Vrbo login was signed out, or a PMS rejected its API key or token (401/403). &#x60;revoked_upstream&#x60; — provider notified us the user revoked access. | [optional] |
| **listings** | [**Array&lt;AccountDisconnectedPayloadListingsInner&gt;**](AccountDisconnectedPayloadListingsInner.md) | The listings this account holds in your workspace — the ones that stop syncing until it is reconnected. Identity only; inactive listings included. Matches &#x60;channels[].account&#x60; on &#x60;GET /v1/listings&#x60;. Empty when the account has no listings here. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AccountDisconnectedPayload.new(
  workspace_id: 47f8883d-28c2-4d2c-b020-c7cef1aff62c,
  account_id: 79730216,
  connection_id: 135,
  provider: airbnb,
  disconnected_at: 2026-05-01T17:00Z,
  reason: refresh_token_rejected,
  listings: null
)
```

