# Repull::AccountImportStage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **expected** | **Integer** | Units of work in this stage (one per page, chunk, listing or thread, depending on the channel). &#x60;null&#x60; until the stage knows its size. | [optional] |
| **done** | **Integer** |  | [optional] |
| **failed** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AccountImportStage.new(
  name: reservations,
  expected: null,
  done: null,
  failed: null
)
```

