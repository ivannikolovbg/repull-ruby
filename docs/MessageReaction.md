# Repull::MessageReaction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The channel&#39;s id for this reaction. | [optional] |
| **emoji** | **String** |  | [optional] |
| **by** | [**MessageActor**](MessageActor.md) |  | [optional] |
| **at** | **Time** | When it was added, as the channel reports it. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MessageReaction.new(
  id: 9e0b945a-b03d-4e28-ad48-5f7fc706a67f,
  emoji: ❤️,
  by: null,
  at: null
)
```

