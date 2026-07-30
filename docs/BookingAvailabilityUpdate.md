# Repull::BookingAvailabilityUpdate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** | Booking.com room id. |  |
| **rate_id** | **String** | Booking.com rate-plan id. |  |
| **date_range** | [**BookingPricingRateUpdateDateRange**](BookingPricingRateUpdateDateRange.md) |  |  |
| **available_rooms** | **Integer** | Rooms to sell (&#x60;roomstosell&#x60;). &#x60;0&#x60; blocks the room for the range. |  |
| **status** | **String** |  | [optional] |
| **closed** | **Boolean** | Dedicated stop-sell flag (&#x60;&lt;closed&gt;&#x60; in Booking&#39;s XML). &#x60;true&#x60; fully stops sale for the room/date-range regardless of &#x60;availableRooms&#x60;. | [optional] |
| **restrictions** | [**BookingPricingRateUpdateRestrictions**](BookingPricingRateUpdateRestrictions.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingAvailabilityUpdate.new(
  room_id: null,
  rate_id: null,
  date_range: null,
  available_rooms: null,
  status: null,
  closed: null,
  restrictions: null
)
```

