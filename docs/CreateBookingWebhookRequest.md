# Repull::CreateBookingWebhookRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **notification_type** | **String** | Booking.com CNS notification type. |  |
| **callback_url** | **String** | HTTPS endpoint Booking.com pushes notifications to. |  |

## Example

```ruby
require 'repull'

instance = Repull::CreateBookingWebhookRequest.new(
  notification_type: null,
  callback_url: null
)
```

