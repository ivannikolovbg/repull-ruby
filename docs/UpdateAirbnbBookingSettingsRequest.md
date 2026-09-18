# Repull::UpdateAirbnbBookingSettingsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instant_book** | [**UpdateAirbnbBookingSettingsRequestInstantBook**](UpdateAirbnbBookingSettingsRequestInstantBook.md) |  | [optional] |
| **check_in** | [**UpdateAirbnbBookingSettingsRequestCheckIn**](UpdateAirbnbBookingSettingsRequestCheckIn.md) |  | [optional] |
| **check_out** | [**UpdateAirbnbBookingSettingsRequestCheckOut**](UpdateAirbnbBookingSettingsRequestCheckOut.md) |  | [optional] |
| **cancellation** | [**UpdateAirbnbBookingSettingsRequestCancellation**](UpdateAirbnbBookingSettingsRequestCancellation.md) |  | [optional] |
| **advance_notice** | [**UpdateAirbnbBookingSettingsRequestAdvanceNotice**](UpdateAirbnbBookingSettingsRequestAdvanceNotice.md) |  | [optional] |
| **preparation_time** | [**UpdateAirbnbBookingSettingsRequestPreparationTime**](UpdateAirbnbBookingSettingsRequestPreparationTime.md) |  | [optional] |
| **booking_window** | [**UpdateAirbnbBookingSettingsRequestBookingWindow**](UpdateAirbnbBookingSettingsRequestBookingWindow.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbBookingSettingsRequest.new(
  instant_book: null,
  check_in: null,
  check_out: null,
  cancellation: null,
  advance_notice: null,
  preparation_time: null,
  booking_window: null
)
```

