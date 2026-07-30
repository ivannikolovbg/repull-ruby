# Repull::GetUsageSummary200ResponseBreakdownInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **operation_id** | **String** |  | [optional] |
| **request_count** | **Integer** |  | [optional] |
| **error_count** | **Integer** |  | [optional] |
| **error_rate** | **Float** |  | [optional] |
| **avg_latency_ms** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetUsageSummary200ResponseBreakdownInner.new(
  operation_id: null,
  request_count: null,
  error_count: null,
  error_rate: null,
  avg_latency_ms: null
)
```

