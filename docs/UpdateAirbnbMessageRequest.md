# Repull::UpdateAirbnbMessageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** | Operation to perform on the message. |  |
| **message** | **String** | New message text. Required when &#x60;action&#x60; is &#x60;edit&#x60;. | [optional] |
| **reaction** | **String** | Reaction to add, e.g. &#x60;👍&#x60;. Required when &#x60;action&#x60; is &#x60;react&#x60;. At most 32 characters; Airbnb decides which reactions it accepts. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbMessageRequest.new(
  action: null,
  message: null,
  reaction: null
)
```

