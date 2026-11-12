# Repull::Workspace

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** |  |  |
| **name** | **String** |  |  |
| **external_ref** | **String** | Your own id for this customer, as you sent it. | [optional] |
| **created_via** | **String** | &#x60;connect&#x60; — opened by a Connect session; &#x60;migrate&#x60; — opened by Repull Migrate. | [optional] |
| **active** | **Boolean** | &#x60;false&#x60; once the workspace was deactivated (&#x60;POST /v1/workspaces/{workspaceId}/deactivate&#x60;, or a deleted migration). Its data is kept. |  |
| **deactivated_at** | **Time** | When the workspace was deactivated; null while active. | [optional] |
| **created_at** | **Time** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::Workspace.new(
  workspace_id: 1204,
  name: Seaside Rentals,
  external_ref: acct_8812,
  created_via: null,
  active: null,
  deactivated_at: null,
  created_at: null
)
```

