# Repull::MigrationChannelMap

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** |  | [optional] |
| **sources** | [**Array&lt;MigrationChannelMapSourcesInner&gt;**](MigrationChannelMapSourcesInner.md) |  | [optional] |
| **listings** | [**Array&lt;MigrationChannelMapListingsInner&gt;**](MigrationChannelMapListingsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationChannelMap.new(
  workspace_id: null,
  sources: null,
  listings: null
)
```

