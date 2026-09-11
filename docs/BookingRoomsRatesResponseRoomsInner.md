# Repull::BookingRoomsRatesResponseRoomsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** | Booking.com room id — use as &#x60;roomId&#x60; in an ARI update. | [optional] |
| **room_name** | **String** |  | [optional] |
| **rates** | [**Array&lt;BookingRoomsRatesResponseRoomsInnerRatesInner&gt;**](BookingRoomsRatesResponseRoomsInnerRatesInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRoomsRatesResponseRoomsInner.new(
  room_id: null,
  room_name: null,
  rates: null
)
```

