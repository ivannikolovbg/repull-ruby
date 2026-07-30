# Repull::UpdateAirbnbMessageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** | Operation to perform on the message. |  |
| **message** | **String** | New message text. Required when &#x60;action&#x60; is &#x60;edit&#x60;. | [optional] |
| **reaction** | **String** | Reaction to add. Required when &#x60;action&#x60; is &#x60;react&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbMessageRequest.new(
  action: null,
  message: null,
  reaction: null
)
```

