# Repull::WebhookDelivery

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **event_id** | **String** | Stable across retries of the same logical event. | [optional] |
| **event_type** | **String** |  | [optional] |
| **status_code** | **Integer** |  | [optional] |
| **response_time_ms** | **Integer** |  | [optional] |
| **attempt** | **Integer** |  | [optional] |
| **success** | **Boolean** |  | [optional] |
| **error_message** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **succeeded_at** | **Time** |  | [optional] |
| **failed_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::WebhookDelivery.new(
  id: null,
  event_id: null,
  event_type: null,
  status_code: null,
  response_time_ms: null,
  attempt: null,
  success: null,
  error_message: null,
  created_at: null,
  succeeded_at: null,
  failed_at: null
)
```

