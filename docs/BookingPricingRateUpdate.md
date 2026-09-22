# Repull::BookingPricingRateUpdate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** | Booking.com room id the rate plan sells. &#x60;GET /v1/channels/booking/properties/{id}/rooms&#x60; lists them. |  |
| **rate_id** | **String** | Booking.com rate-plan id. |  |
| **date_range** | [**BookingPricingRateUpdateDateRange**](BookingPricingRateUpdateDateRange.md) |  |  |
| **price** | **Float** | Nightly amount, in &#x60;currency&#x60;, for a party of &#x60;occupancy&#x60;. |  |
| **currency** | **String** | Currency the rate plan is sold in. |  |
| **single_price** | **Float** | Optional single-occupancy amount, written alongside the main amount. | [optional] |
| **occupancy** | **Integer** | The party size this rate plan prices — a key, not a preference. Booking.com stores the amount against this number: above the rate plan&#39;s own maximum it declines the price in silence and the night keeps its old value; below it, it answers 400 and the old price stays published. Omit it and Repull resolves it from Booking.com&#39;s own data for this (room, rate plan) and echoes the value and its source back in &#x60;occupancy[]&#x60;. When it cannot be resolved the write is refused with &#x60;422&#x60; naming &#x60;updates[N].occupancy&#x60; — a price is never sent at a guessed party size. | [optional] |
| **rooms_to_sell** | **Integer** | Refused. A rate update carries prices only; sending this returns &#x60;422 inventory_not_in_rate_update&#x60; naming &#x60;updates[N].roomsToSell&#x60;. Write inventory with &#x60;type: \&quot;availability\&quot;&#x60; and &#x60;availableRooms&#x60; (plus &#x60;closed: true&#x60; for a stop-sell). | [optional] |
| **restrictions** | [**BookingPricingRateUpdateRestrictions**](BookingPricingRateUpdateRestrictions.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPricingRateUpdate.new(
  room_id: null,
  rate_id: null,
  date_range: null,
  price: null,
  currency: EUR,
  single_price: null,
  occupancy: null,
  rooms_to_sell: null,
  restrictions: null
)
```

