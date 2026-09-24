# Repull::MigrationImportRun

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional] |
| **started_at** | **Time** |  | [optional] |
| **finished_at** | **Time** |  | [optional] |
| **entities** | **Array&lt;String&gt;** |  | [optional] |
| **results** | [**Array&lt;MigrationImportRunResultsInner&gt;**](MigrationImportRunResultsInner.md) |  | [optional] |
| **error** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationImportRun.new(
  status: null,
  started_at: null,
  finished_at: null,
  entities: null,
  results: null,
  error: null
)
```

