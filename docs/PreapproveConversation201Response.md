# Repull::PreapproveConversation201Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **conversation_id** | **String** |  |  |
| **channel** | **String** |  |  |
| **status** | **String** |  |  |
| **block_instant_booking** | **Boolean** |  |  |
| **expires_at** | **Time** | When the guest can no longer book on the pre-approval, if the channel reported it. |  |
| **message** | **String** | The message sent to the guest with the pre-approval (VRBO). |  |

## Example

```ruby
require 'repull'

instance = Repull::PreapproveConversation201Response.new(
  conversation_id: 164743,
  channel: airbnb,
  status: null,
  block_instant_booking: false,
  expires_at: null,
  message: null
)
```

