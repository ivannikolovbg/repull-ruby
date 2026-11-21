# Repull::UpdateVrboListingBookingSettings200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **booking_type** | **String** |  | [optional] |
| **instant_booking_eligible** | **Boolean** |  | [optional] |
| **min_nights** | **Integer** |  | [optional] |
| **min_nights_range** | [**GetVrboListingBookingSettings200ResponseDataMinNightsRange**](GetVrboListingBookingSettings200ResponseDataMinNightsRange.md) |  | [optional] |
| **min_days_before_booking** | **Integer** |  | [optional] |
| **min_days_before_booking_options** | **Array&lt;Integer&gt;** |  | [optional] |
| **max_months_before_booking** | **Integer** |  | [optional] |
| **max_months_before_booking_options** | **Array&lt;Integer&gt;** |  | [optional] |
| **max_length_of_stay** | **Integer** |  | [optional] |
| **access_type** | **String** |  | [optional] |
| **access_type_options** | [**Array&lt;GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerOptionsInner&gt;**](GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerOptionsInner.md) |  | [optional] |
| **check_in_time** | **String** |  | [optional] |
| **check_out_time** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingBookingSettings200ResponseData.new(
  booking_type: null,
  instant_booking_eligible: null,
  min_nights: null,
  min_nights_range: null,
  min_days_before_booking: null,
  min_days_before_booking_options: null,
  max_months_before_booking: null,
  max_months_before_booking_options: null,
  max_length_of_stay: null,
  access_type: null,
  access_type_options: null,
  check_in_time: null,
  check_out_time: null
)
```

