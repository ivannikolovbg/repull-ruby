# Repull::UpdateVrboListingBookingSettingsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **booking_type** | **String** |  | [optional] |
| **min_nights** | **Integer** |  | [optional] |
| **min_days_before_booking** | **Integer** | One of the read&#39;s &#x60;minDaysBeforeBookingOptions&#x60;. | [optional] |
| **max_months_before_booking** | **Integer** |  | [optional] |
| **max_length_of_stay** | **Integer** |  | [optional] |
| **access_type** | **String** | One of the read&#39;s &#x60;accessTypeOptions[].value&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingBookingSettingsRequest.new(
  booking_type: null,
  min_nights: null,
  min_days_before_booking: null,
  max_months_before_booking: null,
  max_length_of_stay: null,
  access_type: null
)
```

