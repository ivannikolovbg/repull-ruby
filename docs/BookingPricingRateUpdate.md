# Repull::BookingPricingRateUpdate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** | Booking.com room ID for the rate plan. Comes from &#x60;listings_booking_rooms&#x60; mapping. |  |
| **rate_id** | **String** | Booking.com rate-plan ID. |  |
| **date_range** | [**BookingPricingRateUpdateDateRange**](BookingPricingRateUpdateDateRange.md) |  |  |
| **price** | **Float** |  |  |
| **currency** | **String** |  |  |
| **single_price** | **Float** |  | [optional] |
| **occupancy** | **Integer** |  | [optional] |
| **rooms_to_sell** | **Integer** | Rooms to sell for the date range. Set to &#x60;0&#x60; to stop-sell this room/rate on the rates endpoint (Booking&#39;s dedicated &#x60;&lt;closed&gt;&#x60; stop-sell flag lives on the availability endpoint — see &#x60;BookingAvailabilityUpdate.closed&#x60;). | [optional] |
| **restrictions** | [**BookingPricingRateUpdateRestrictions**](BookingPricingRateUpdateRestrictions.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPricingRateUpdate.new(
  room_id: null,
  rate_id: null,
  date_range: null,
  price: null,
  currency: USD,
  single_price: null,
  occupancy: null,
  rooms_to_sell: null,
  restrictions: null
)
```

