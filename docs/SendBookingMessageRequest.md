# Repull::SendBookingMessageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **Integer** | Booking.com property (hotel) id the conversation belongs to. |  |
| **conversation_id** | **String** | Booking.com conversation id to reply in. |  |
| **message** | **String** | Message body to send to the guest. |  |

## Example

```ruby
require 'repull'

instance = Repull::SendBookingMessageRequest.new(
  property_id: null,
  conversation_id: null,
  message: null
)
```

