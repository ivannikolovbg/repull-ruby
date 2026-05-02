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
| **rooms_to_sell** | **Integer** |  | [optional] |
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

