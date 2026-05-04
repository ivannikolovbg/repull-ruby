# Repull::AccountDisconnectedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** |  | [optional] |
| **account_id** | **String** |  | [optional] |
| **connection_id** | **String** | Stable connection identifier — alias of accountId for this event variant. | [optional] |
| **provider** | **String** |  | [optional] |
| **disconnected_at** | **Time** |  | [optional] |
| **reason** | **String** | Why the connection was lost. &#x60;refresh_token_rejected&#x60; — upstream OAuth refresh endpoint returned a hard rejection. &#x60;manual_disconnect&#x60; — host/admin disconnected via the dashboard. &#x60;auth_expired&#x60; — credentials aged out without ever being used. &#x60;revoked_upstream&#x60; — provider notified us the user revoked access. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AccountDisconnectedPayload.new(
  workspace_id: 47f8883d-28c2-4d2c-b020-c7cef1aff62c,
  account_id: acc_01HX5XPQ2K,
  connection_id: null,
  provider: airbnb,
  disconnected_at: 2026-05-01T17:00Z,
  reason: refresh_token_rejected
)
```

