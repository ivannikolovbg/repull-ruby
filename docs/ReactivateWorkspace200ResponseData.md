# Repull::ReactivateWorkspace200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** |  | [optional] |
| **active** | **Boolean** |  | [optional] |
| **reactivated_at** | **Time** | Null when the workspace was already active. | [optional] |
| **already_active** | **Boolean** | True when the workspace was already active — nothing was changed. | [optional] |
| **listings_reactivated** | **Array&lt;String&gt;** | Listings switched back on. | [optional] |
| **accounts_reconnect_required** | **Boolean** | Accounts are never reconnected by this call. | [optional] |
| **next_step** | **String** | What to do next: reconnect the accounts through Connect. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReactivateWorkspace200ResponseData.new(
  workspace_id: null,
  active: null,
  reactivated_at: null,
  already_active: null,
  listings_reactivated: null,
  accounts_reconnect_required: null,
  next_step: null
)
```

