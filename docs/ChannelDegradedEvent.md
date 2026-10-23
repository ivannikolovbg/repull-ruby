# Repull::ChannelDegradedEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event** | **String** | The event name. This field is &#x60;event&#x60;, not &#x60;type&#x60;. |  |
| **event_id** | **String** |  |  |
| **api_version** | **String** |  |  |
| **timestamp** | **Time** |  |  |
| **account** | [**WebhookEventAccount**](WebhookEventAccount.md) |  | [optional] |
| **data** | [**ChannelDegradedPayload**](ChannelDegradedPayload.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ChannelDegradedEvent.new(
  event: null,
  event_id: null,
  api_version: 2026-04,
  timestamp: null,
  account: null,
  data: null
)
```

