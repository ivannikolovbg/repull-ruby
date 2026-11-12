# Repull::DeactivateWorkspace200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** |  | [optional] |
| **active** | **Boolean** |  | [optional] |
| **deactivated_at** | **Time** |  | [optional] |
| **already_inactive** | **Boolean** | True when the workspace was already inactive before this call. | [optional] |
| **disconnected** | [**Array&lt;DeactivateWorkspace200ResponseDataDisconnectedInner&gt;**](DeactivateWorkspace200ResponseDataDisconnectedInner.md) | Accounts that were still connected and are now disconnected. | [optional] |
| **listings_deactivated** | **Array&lt;String&gt;** | Listings this call switched off. &#x60;reactivate&#x60; switches these back on. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::DeactivateWorkspace200ResponseData.new(
  workspace_id: null,
  active: null,
  deactivated_at: null,
  already_inactive: null,
  disconnected: null,
  listings_deactivated: null
)
```

