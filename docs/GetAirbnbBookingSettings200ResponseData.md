# Repull::GetAirbnbBookingSettings200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **booking_mode** | **String** | Derived from &#x60;instantBook&#x60;. &#x60;request_to_book&#x60; means every booking needs the host to approve it. | [optional] |
| **instant_book** | [**GetAirbnbBookingSettings200ResponseDataInstantBook**](GetAirbnbBookingSettings200ResponseDataInstantBook.md) |  | [optional] |
| **check_in** | [**GetAirbnbBookingSettings200ResponseDataCheckIn**](GetAirbnbBookingSettings200ResponseDataCheckIn.md) |  | [optional] |
| **check_out** | [**GetAirbnbBookingSettings200ResponseDataCheckOut**](GetAirbnbBookingSettings200ResponseDataCheckOut.md) |  | [optional] |
| **advance_notice** | [**GetAirbnbBookingSettings200ResponseDataAdvanceNotice**](GetAirbnbBookingSettings200ResponseDataAdvanceNotice.md) |  | [optional] |
| **preparation_time** | [**GetAirbnbBookingSettings200ResponseDataPreparationTime**](GetAirbnbBookingSettings200ResponseDataPreparationTime.md) |  | [optional] |
| **booking_window** | [**GetAirbnbBookingSettings200ResponseDataBookingWindow**](GetAirbnbBookingSettings200ResponseDataBookingWindow.md) |  | [optional] |
| **cancellation** | [**GetAirbnbBookingSettings200ResponseDataCancellation**](GetAirbnbBookingSettings200ResponseDataCancellation.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbBookingSettings200ResponseData.new(
  booking_mode: null,
  instant_book: null,
  check_in: null,
  check_out: null,
  advance_notice: null,
  preparation_time: null,
  booking_window: null,
  cancellation: null
)
```

