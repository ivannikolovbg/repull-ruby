# Repull::BookingRoomsRatesResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | Booking.com hotel/property id the rooms belong to — the one the mapping resolved to. | [optional] |
| **listing_id** | **String** | Repull listing id echoed back. | [optional] |
| **other_hotel_ids** | **Array&lt;String&gt;** | Other Booking.com properties this listing is also published under. Empty in the normal case. Pass one as &#x60;?hotel_id&#x3D;&#x60; to read its rooms instead. | [optional] |
| **source** | **String** | Where the rooms came from. &#x60;booking&#x60; — read live from Booking.com just now. &#x60;mirror&#x60; — Booking.com returned nothing usable, so these are the rooms and rate plans recorded at the last import; the ids are Booking.com&#39;s own and are safe to write against, but they can be stale and &#x60;maxPersons&#x60;, &#x60;policy&#x60;, &#x60;policyId&#x60;, &#x60;pricingType&#x60; and &#x60;isChildRate&#x60; come back &#x60;null&#x60; because only the live feed states them. | [optional] |
| **mirror_reason** | **String** | Why the live read was not used. Null when &#x60;source&#x60; is &#x60;booking&#x60;. | [optional] |
| **rooms** | [**Array&lt;BookingRoomsRatesResponseRoomsInner&gt;**](BookingRoomsRatesResponseRoomsInner.md) | Empty only when Booking.com reports no rooms for this property AND nothing was recorded at the last import. A failed read is never an empty list — it is an error. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRoomsRatesResponse.new(
  hotel_id: null,
  listing_id: null,
  other_hotel_ids: null,
  source: null,
  mirror_reason: null,
  rooms: null
)
```

