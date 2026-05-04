# Repull::AiOperationFailedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **operation_id** | **String** |  | [optional] |
| **type** | **String** |  | [optional] |
| **error** | [**AiOperationFailedPayloadError**](AiOperationFailedPayloadError.md) |  | [optional] |
| **failed_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AiOperationFailedPayload.new(
  operation_id: aiop_01HX5XPQ2L,
  type: price-suggestion,
  error: null,
  failed_at: 2026-05-01T18:01Z
)
```

