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
| **dashboard_surface** | **String** | The repull.dev dashboard page this call was run from (&#x60;keys&#x60;, &#x60;playground&#x60;, &#x60;quickstart&#x60;, &#x60;connect&#x60;, &#x60;settings/connect&#x60;), or null for a call your own code made. Dashboard calls don&#39;t count toward your plan&#39;s request quota. | [optional] |
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
  dashboard_surface: null,
  created_at: null
)
```

