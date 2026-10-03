# Repull::SendMessageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | The text to send the guest. Required unless &#x60;attachments&#x60; is present. | [optional] |
| **channel** | **String** | Force a channel. Omit to send on whichever channel the conversation already uses, which is the right default. One of &#x60;airbnb&#x60;, &#x60;booking&#x60;, &#x60;vrbo&#x60;, &#x60;sms&#x60;, &#x60;email&#x60;, &#x60;website&#x60; — except on a conversation a connected PMS relays (Guesty, Hostaway, …), where the message is sent through the PMS and &#x60;channel&#x60; is passed to it: the PMS&#39;s own channel/module name (Guesty &#x60;airbnb2&#x60;, &#x60;bookingCom&#x60;, &#x60;email&#x60;, &#x60;sms&#x60;, …) or one of Repull&#39;s names, which the PMS maps. A PMS that cannot choose a channel returns &#x60;422 pms_write_unsupported&#x60;; &#x60;GET /v1/connect/{provider}&#x60; → &#x60;capabilities.pms.conversations.channelSelect&#x60; says so beforehand. | [optional] |
| **attachments** | [**Array&lt;SendMessageAttachment&gt;**](SendMessageAttachment.md) | Files to send. See the per-channel table above. On a conversation a connected PMS relays, files go through the PMS — &#x60;422 pms_write_unsupported&#x60; when its API cannot send them (&#x60;capabilities.pms.conversations.attachments&#x60; on &#x60;GET /v1/connect/{provider}&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SendMessageRequest.new(
  message: Here is the parking map — the gate code is 4821.,
  channel: email,
  attachments: null
)
```

