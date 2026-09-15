# Repull::BookingRoomMapping

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** | Repull-side &#x60;listings_booking_rooms.id&#x60; from &#x60;listConnectBookingRooms&#x60;. |  |
| **listing_id** | **String** | Repull listing to bind to this room. &#x60;null&#x60; to unmap. Omit when &#x60;create&#x60; is true. | [optional] |
| **create** | **Boolean** | Create a new listing for this room and map it, instead of binding an existing one. Mutually exclusive with &#x60;listingId&#x60; — sending both is rejected with 400 rather than silently resolved. Idempotent: a room that is already mapped keeps its existing listing and no duplicate is created. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRoomMapping.new(
  room_id: null,
  listing_id: null,
  create: null
)
```

