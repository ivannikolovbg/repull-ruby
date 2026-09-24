# Repull::MapBookingRoomRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_booking_id** | **String** | Booking.com&#39;s own room id. Discover it via &#x60;GET /v1/channels/booking/properties/{id}/rooms&#x60; (&#x60;rooms[].roomId&#x60;). A number is also accepted. |  |
| **listing_id** | **Integer** | Canonical Repull listing id to link the room to. Must belong to your workspace and be active. &#x60;null&#x60; unmaps the room and removes its channel link. The field is required — omitting it is a 422, not an unmap. |  |
| **hotel_id** | **String** | Optional. When present, must be the Booking.com property the room belongs to — guards against mapping a room of the wrong property when looping over several. | [optional] |
| **sync_enabled** | **Boolean** | Whether the resulting channel link has sync enabled. | [optional][default to true] |

## Example

```ruby
require 'repull'

instance = Repull::MapBookingRoomRequest.new(
  room_booking_id: null,
  listing_id: null,
  hotel_id: null,
  sync_enabled: null
)
```

