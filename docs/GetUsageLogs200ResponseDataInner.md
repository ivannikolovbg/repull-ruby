# Repull::GetUsageLogs200ResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **request_id** | **String** |  | [optional] |
| **method** | **String** |  | [optional] |
| **path** | **String** |  | [optional] |
| **operation_id** | **String** |  | [optional] |
| **status_code** | **Integer** |  | [optional] |
| **latency_ms** | **Integer** |  | [optional] |
| **request_bytes** | **Integer** |  | [optional] |
| **response_bytes** | **Integer** |  | [optional] |
| **ip_address** | **String** |  | [optional] |
| **user_agent** | **String** |  | [optional] |
| **error_code** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetUsageLogs200ResponseDataInner.new(
  id: null,
  request_id: null,
  method: null,
  path: null,
  operation_id: null,
  status_code: null,
  latency_ms: null,
  request_bytes: null,
  response_bytes: null,
  ip_address: null,
  user_agent: null,
  error_code: null,
  created_at: null
)
```

