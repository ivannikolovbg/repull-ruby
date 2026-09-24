# Repull::Migration

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** | Pass as &#x60;X-Workspace-Id&#x60; to read this property manager&#39;s listings, reservations and conversations through the regular endpoints. |  |
| **name** | **String** |  |  |
| **external_ref** | **String** | Your own id for this property manager, as sent when the migration was created. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **state** | **String** | &#x60;awaiting_connection&#x60; — not connected yet. &#x60;importing&#x60; — the first import is running. &#x60;imported&#x60; — data is in and kept fresh until cutover. &#x60;failed&#x60; — the last import failed (see &#x60;connections[].import.error&#x60;). &#x60;cut_over&#x60; — the source was disconnected. &#x60;deactivated&#x60; — the migration was deleted. |  |
| **cutover_at** | **Time** |  | [optional] |
| **connections** | [**Array&lt;MigrationConnectionsInner&gt;**](MigrationConnectionsInner.md) |  |  |
| **counts** | [**MigrationCounts**](MigrationCounts.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::Migration.new(
  workspace_id: 1204,
  name: Seaside Rentals,
  external_ref: null,
  created_at: null,
  state: null,
  cutover_at: null,
  connections: null,
  counts: null
)
```

