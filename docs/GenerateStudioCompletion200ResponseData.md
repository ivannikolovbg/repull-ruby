# Repull::GenerateStudioCompletion200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **text** | **String** | Generated completion text. | [optional] |
| **generation_id** | **String** |  | [optional] |
| **model** | **String** | Model identifier that produced the response. | [optional] |
| **tokens_in** | **Integer** |  | [optional] |
| **tokens_out** | **Integer** |  | [optional] |
| **latency_ms** | **Integer** |  | [optional] |
| **cost_usd_micro** | **Integer** | Cost in millionths of a USD. | [optional] |
| **cached** | **Boolean** | True if the response was served from cache. | [optional] |
| **fallback** | **Boolean** | True if the primary model failed and Repull AI fell back to the secondary. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GenerateStudioCompletion200ResponseData.new(
  text: null,
  generation_id: null,
  model: null,
  tokens_in: null,
  tokens_out: null,
  latency_ms: null,
  cost_usd_micro: null,
  cached: null,
  fallback: null
)
```

