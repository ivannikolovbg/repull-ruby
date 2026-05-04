# Repull::CreateWebhookRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** |  |  |
| **events** | [**Array&lt;WebhookEventType&gt;**](WebhookEventType.md) |  |  |
| **description** | **String** |  | [optional] |
| **api_version** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateWebhookRequest.new(
  url: null,
  events: null,
  description: null,
  api_version: 2026-04
)
```

