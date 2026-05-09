# Repull::AirbnbConnectionHost

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **airbnb_user_id** | **String** | Upstream Airbnb user id. |  |
| **name** | **String** | Display name (preferred form, falling back to legal first name). Null when both fields are empty. |  |
| **is_connected** | **Boolean** |  |  |
| **last_synced_at** | **Time** | When the host record was last touched (token refresh / activation / restriction). Closest available proxy for \&quot;last successful sync\&quot;. |  |
| **deactivated_at** | **Time** | When the host was last marked inactive. Null on currently-connected hosts. |  |
| **last_disconnect_reason** | **String** | Reason of the most recent non-backfill disconnect event. Common values: &#x60;token_refresh_rejected&#x60;, &#x60;auth_expired&#x60;, &#x60;user_revoked&#x60;. Null when the host has no recorded disconnects. |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbConnectionHost.new(
  airbnb_user_id: 719854265,
  name: STR Assistance,
  is_connected: false,
  last_synced_at: null,
  deactivated_at: null,
  last_disconnect_reason: token_refresh_rejected
)
```

