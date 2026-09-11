# Repull::SendMessageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | The text to send the guest. |  |
| **channel** | **String** | Force a channel. Omit to send on whichever channel the conversation already uses, which is the right default. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SendMessageRequest.new(
  message: Your check-in details are ready — the door code is active from 16:00.,
  channel: null
)
```

