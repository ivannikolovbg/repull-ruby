# Repull::MigrationImportPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** |  | [optional] |
| **provider** | **String** |  | [optional] |
| **connection_id** | **Integer** |  | [optional] |
| **status** | **String** |  | [optional] |
| **started_at** | **Time** |  | [optional] |
| **finished_at** | **Time** |  | [optional] |
| **entities** | **Array&lt;String&gt;** |  | [optional] |
| **results** | [**Array&lt;MigrationImportPayloadResultsInner&gt;**](MigrationImportPayloadResultsInner.md) |  | [optional] |
| **error** | **String** | Present on &#x60;migration.failed&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationImportPayload.new(
  workspace_id: null,
  provider: guesty,
  connection_id: null,
  status: null,
  started_at: null,
  finished_at: null,
  entities: null,
  results: null,
  error: null
)
```

