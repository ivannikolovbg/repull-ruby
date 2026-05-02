# Repull::BookingConnectRoom

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **Integer** | Repull-side &#x60;listings_booking_rooms.id&#x60;. Pass this back in the mapping submission. |  |
| **room_name** | **String** |  |  |
| **max_guests** | **Integer** |  | [optional] |
| **number_of_rooms** | **Integer** | Number of inventory units of this room type at the hotel. |  |
| **current_listing_id** | **Integer** | Currently mapped Repull listing ID, or null if not yet mapped. | [optional] |
| **room_booking_id** | **Integer** | Booking.com-side room ID (used internally for &#x60;listing_platform_links&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingConnectRoom.new(
  room_id: null,
  room_name: Deluxe King,
  max_guests: null,
  number_of_rooms: null,
  current_listing_id: null,
  room_booking_id: null
)
```

