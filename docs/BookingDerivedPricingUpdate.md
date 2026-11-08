# Repull::BookingDerivedPricingUpdate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** | Booking.com room id. |  |
| **rate_id** | **String** | Booking.com rate-plan id. Its &#x60;pricingType&#x60; must be &#x60;RLO&#x60; or &#x60;OBP&#x60;. |  |
| **leading_occupancy** | **Integer** | The party size the nightly price is for. Must equal the rate plan&#39;s &#x60;maxPersons&#x60; (&#x60;GET /v1/channels/booking/properties/{id}/rooms&#x60;): Booking.com accepts a different value and then drops every nightly price on the rate plan, so any other value is refused with &#x60;422&#x60;. |  |
| **occupancies** | [**Array&lt;BookingOccupancyRule&gt;**](BookingOccupancyRule.md) | The rules, one per party size. &#x60;rules&#x60; is accepted as an alias. Empty removes every rule. |  |

## Example

```ruby
require 'repull'

instance = Repull::BookingDerivedPricingUpdate.new(
  room_id: 1761085301,
  rate_id: 70596570,
  leading_occupancy: 3,
  occupancies: [{&quot;persons&quot;:2,&quot;additional&quot;:-12.01},{&quot;persons&quot;:1,&quot;additional&quot;:-12.01}]
)
```

