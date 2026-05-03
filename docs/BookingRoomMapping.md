# Repull::BookingRoomMapping

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** | Repull-side &#x60;listings_booking_rooms.id&#x60; from &#x60;listConnectBookingRooms&#x60;. |  |
| **listing_id** | **String** | Repull listing to bind to this room. &#x60;null&#x60; to unmap. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRoomMapping.new(
  room_id: null,
  listing_id: null
)
```

