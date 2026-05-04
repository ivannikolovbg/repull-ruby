# Repull::TestWebhookRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** |  | [optional] |
| **event_type** | [**WebhookEventType**](WebhookEventType.md) |  | [optional] |
| **signing_secret** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TestWebhookRequest.new(
  url: null,
  event_type: null,
  signing_secret: null
)
```

