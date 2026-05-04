# Repull::StudioGeneration

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **generation_id** | **String** |  | [optional] |
| **project_id** | **String** |  | [optional] |
| **prompt** | **String** |  | [optional] |
| **response** | **String** | Generated text output. | [optional] |
| **tokens_in** | **Integer** | Prompt tokens consumed. | [optional] |
| **tokens_out** | **Integer** | Completion tokens produced. | [optional] |
| **model** | **String** | Model identifier used to produce the response. | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::StudioGeneration.new(
  generation_id: null,
  project_id: null,
  prompt: null,
  response: null,
  tokens_in: null,
  tokens_out: null,
  model: null,
  created_at: null
)
```

