# Repull::AiOperationCompletedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **operation_id** | **String** |  | [optional] |
| **type** | **String** | AI operation kind — e.g. respond-to-guest, price-suggestion, review-response. | [optional] |
| **input_summary** | **String** |  | [optional] |
| **output** | **Hash&lt;String, Object&gt;** | Operation-specific output object. | [optional] |
| **tokens_used** | **Integer** |  | [optional] |
| **completed_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AiOperationCompletedPayload.new(
  operation_id: aiop_01HX5XPQ2K,
  type: respond-to-guest,
  input_summary: Guest asked about parking,
  output: {&quot;message&quot;:&quot;Free underground parking is included with your stay.&quot;},
  tokens_used: 184,
  completed_at: 2026-05-01T18:00Z
)
```

