# Repull::AirbnbConnectionHost

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **airbnb_user_id** | **String** | Upstream Airbnb user id. |  |
| **name** | **String** | Display name (preferred form, falling back to legal first name). Null when both fields are empty. |  |
| **is_connected** | **Boolean** |  |  |
| **last_synced_at** | **Time** | When this account last COMPLETED an Airbnb import. &#x60;null&#x60; when it never has. A run that failed or was rate-limited does not move it, and neither does anything other than a sync. |  |
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

