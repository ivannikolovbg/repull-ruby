# Repull::BookingVerifyHotelRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** | The Connect session ID returned by &#x60;createConnectSession&#x60;. Acts as the capability token — no API key required. |  |
| **hotel_id** | **String** | Booking.com hotel ID the customer pasted. 6+ digits. |  |

## Example

```ruby
require 'repull'

instance = Repull::BookingVerifyHotelRequest.new(
  session_id: cs_8gQrT2v9k3M4nLp7wJxYzAbCdEfGhIjKlMnOp,
  hotel_id: 12345678
)
```

