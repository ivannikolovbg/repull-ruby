# Repull::BookingRateWriteVerificationRow

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** |  | [optional] |
| **rate_id** | **String** |  | [optional] |
| **date** | **Date** |  | [optional] |
| **expected_price** | **Float** | The amount that was sent. | [optional] |
| **booking_price** | **Float** | The amount Booking.com holds for that night now; &#x60;null&#x60; when Booking.com reported nothing for it. | [optional] |
| **match** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRateWriteVerificationRow.new(
  room_id: null,
  rate_id: null,
  date: null,
  expected_price: null,
  booking_price: null,
  match: null
)
```

