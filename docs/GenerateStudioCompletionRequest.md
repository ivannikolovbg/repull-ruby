# Repull::GenerateStudioCompletionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_id** | [**GenerateStudioCompletionRequestProjectId**](GenerateStudioCompletionRequestProjectId.md) |  |  |
| **prompt** | **String** | User prompt. Up to 32,000 characters. |  |
| **system_prompt** | **String** | Optional system prompt to steer the response. | [optional] |
| **temperature** | **Float** | Sampling temperature. Defaults to model preset. | [optional] |
| **max_tokens** | **Integer** | Maximum completion tokens. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GenerateStudioCompletionRequest.new(
  project_id: null,
  prompt: null,
  system_prompt: null,
  temperature: null,
  max_tokens: null
)
```

