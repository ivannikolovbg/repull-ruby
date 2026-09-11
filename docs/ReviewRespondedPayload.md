# Repull::ReviewRespondedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ReviewWebhookObject**](ReviewWebhookObject.md) |  |  |
| **responded_at** | **Time** | When the host response was recorded. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReviewRespondedPayload.new(
  object: null,
  responded_at: 2026-05-02T11:00Z
)
```

