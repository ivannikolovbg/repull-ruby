# Repull::RecheckBookingExtranetLoginRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | The Connect session ID (capability token). |  |
| **account_id** | **Integer** | The Booking.com direct-login connection id returned when the sign-in started. |  |

## Example

```ruby
require 'repull'

instance = Repull::RecheckBookingExtranetLoginRequest.new(
  session_id: null,
  account_id: null
)
```

