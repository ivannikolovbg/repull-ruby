# Repull::MessageActor

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | &#x60;guest&#x60;, &#x60;cotraveler&#x60;, &#x60;booker&#x60;, &#x60;host&#x60; or &#x60;cohost&#x60;. &#x60;unknown&#x60; when the channel did not say. | [optional] |
| **name** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MessageActor.new(
  type: guest,
  name: Maya
)
```

