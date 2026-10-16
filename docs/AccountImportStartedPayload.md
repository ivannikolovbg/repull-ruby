# Repull::AccountImportStartedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **import_id** | **String** |  | [optional] |
| **trigger** | **String** |  | [optional] |
| **started_at** | **Time** |  | [optional] |
| **stages** | **Array&lt;String&gt;** | The stages this import will run. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AccountImportStartedPayload.new(
  import_id: null,
  trigger: null,
  started_at: null,
  stages: null
)
```

