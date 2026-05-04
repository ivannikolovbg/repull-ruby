# Repull::WebhookSubscription

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **url** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **events** | [**Array&lt;WebhookEventType&gt;**](WebhookEventType.md) |  | [optional] |
| **api_version** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **consecutive_failures** | **Integer** |  | [optional] |
| **last_delivered_at** | **Time** |  | [optional] |
| **last_success_at** | **Time** |  | [optional] |
| **last_failure_at** | **Time** |  | [optional] |
| **last_delivery_status** | **Integer** |  | [optional] |
| **disabled_at** | **Time** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **secret_masked** | **String** |  | [optional] |
| **secret** | **String** | Plaintext signing secret. Only returned by create + rotate. Capture and store securely. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::WebhookSubscription.new(
  id: null,
  url: null,
  description: null,
  events: [&quot;reservation.created&quot;,&quot;reservation.updated&quot;],
  api_version: 2026-04,
  status: null,
  consecutive_failures: null,
  last_delivered_at: null,
  last_success_at: null,
  last_failure_at: null,
  last_delivery_status: null,
  disabled_at: null,
  created_at: null,
  updated_at: null,
  secret_masked: whsec_a1b…f9c2,
  secret: null
)
```

