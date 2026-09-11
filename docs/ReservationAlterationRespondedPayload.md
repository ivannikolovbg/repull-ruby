# Repull::ReservationAlterationRespondedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**AlterationWebhookObject**](AlterationWebhookObject.md) |  |  |
| **responded_at** | **Time** | When the response was recorded. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationAlterationRespondedPayload.new(
  object: null,
  responded_at: 2026-05-01T16:30Z
)
```

