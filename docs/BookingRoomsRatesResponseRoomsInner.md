# Repull::BookingRoomsRatesResponseRoomsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** | Booking.com room id — use as &#x60;roomId&#x60; in an ARI update. | [optional] |
| **room_name** | **String** |  | [optional] |
| **max_adults** | **Integer** | Booking.com&#39;s capacity for this room, as imported. The occupancy a rate write falls back to when the rate plan states no &#x60;maxPersons&#x60;. Null when Booking.com never stated one. | [optional] |
| **rates** | [**Array&lt;BookingRoomsRatesResponseRoomsInnerRatesInner&gt;**](BookingRoomsRatesResponseRoomsInnerRatesInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRoomsRatesResponseRoomsInner.new(
  room_id: null,
  room_name: null,
  max_adults: null,
  rates: null
)
```

