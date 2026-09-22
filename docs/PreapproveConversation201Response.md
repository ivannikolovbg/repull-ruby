# Repull::PreapproveConversation201Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **conversation_id** | **String** |  |  |
| **status** | **String** |  |  |
| **block_instant_booking** | **Boolean** |  |  |
| **expires_at** | **Time** | When the guest can no longer book on the pre-approval, if Airbnb reported it. |  |

## Example

```ruby
require 'repull'

instance = Repull::PreapproveConversation201Response.new(
  conversation_id: 164743,
  status: null,
  block_instant_booking: false,
  expires_at: null
)
```

