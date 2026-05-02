# Repull::WebhookDeliveryDetail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **event_id** | **String** |  | [optional] |
| **event_type** | **String** |  | [optional] |
| **payload** | **Object** |  | [optional] |
| **request_headers** | **Object** |  | [optional] |
| **status_code** | **Integer** |  | [optional] |
| **response_headers** | **Object** |  | [optional] |
| **response_body** | **String** |  | [optional] |
| **response_time_ms** | **Integer** |  | [optional] |
| **attempt** | **Integer** |  | [optional] |
| **success** | **Boolean** |  | [optional] |
| **error_message** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::WebhookDeliveryDetail.new(
  id: null,
  event_id: null,
  event_type: null,
  payload: null,
  request_headers: null,
  status_code: null,
  response_headers: null,
  response_body: null,
  response_time_ms: null,
  attempt: null,
  success: null,
  error_message: null,
  created_at: null
)
```

