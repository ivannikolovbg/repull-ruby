# Repull::ReservationMessageReactionPayloadReaction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **emoji** | **String** |  | [optional] |
| **by** | [**MessageActor**](MessageActor.md) |  | [optional] |
| **at** | **Time** | When it was added; for &#x60;removed&#x60;, when Repull saw it go. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageReactionPayloadReaction.new(
  id: 9e0b945a-b03d-4e28-ad48-5f7fc706a67f,
  emoji: ❤️,
  by: null,
  at: null
)
```

