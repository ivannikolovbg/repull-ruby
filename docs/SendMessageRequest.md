# Repull::SendMessageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | The text to send the guest. Required unless &#x60;attachments&#x60; is present. | [optional] |
| **channel** | **String** | Force a channel. Omit to send on whichever channel the conversation already uses, which is the right default. | [optional] |
| **attachments** | [**Array&lt;SendMessageAttachment&gt;**](SendMessageAttachment.md) | Files to send. See the per-channel table above. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SendMessageRequest.new(
  message: Here is the parking map — the gate code is 4821.,
  channel: null,
  attachments: null
)
```

