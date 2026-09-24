# Repull::MigrationConnectionsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **provider** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **connected_at** | **Time** |  | [optional] |
| **last_polled_at** | **Time** |  | [optional] |
| **import** | [**MigrationImportRun**](MigrationImportRun.md) | The last import run, or null before the first one (and for channels, which sync on their own schedule). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationConnectionsInner.new(
  id: null,
  provider: guesty,
  status: active,
  connected_at: null,
  last_polled_at: null,
  import: null
)
```

