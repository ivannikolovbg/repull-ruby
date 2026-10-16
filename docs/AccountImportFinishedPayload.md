# Repull::AccountImportFinishedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **import_id** | **String** |  | [optional] |
| **trigger** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **outcome** | **String** |  | [optional] |
| **started_at** | **Time** |  | [optional] |
| **completed_at** | **Time** |  | [optional] |
| **stages** | [**Array&lt;AccountImportStage&gt;**](AccountImportStage.md) |  | [optional] |
| **counts** | [**AccountImportCounts**](AccountImportCounts.md) |  | [optional] |
| **reason** | **String** | &#x60;account.import.failed&#x60; only. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AccountImportFinishedPayload.new(
  import_id: null,
  trigger: null,
  status: null,
  outcome: null,
  started_at: null,
  completed_at: null,
  stages: null,
  counts: null,
  reason: null
)
```

