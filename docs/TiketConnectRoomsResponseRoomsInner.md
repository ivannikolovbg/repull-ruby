# Repull::TiketConnectRoomsResponseRoomsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** | Pass this back in &#x60;POST /v1/connect/tiket/map-rooms&#x60;. | [optional] |
| **room_name** | **String** |  | [optional] |
| **max_guests** | **Integer** |  | [optional] |
| **number_of_rooms** | **Integer** |  | [optional] |
| **current_listing_id** | **String** |  | [optional] |
| **room_booking_id** | **String** | tiket.com room type code (&#x60;roomTypeCode&#x60; on &#x60;GET /v1/channels/tiket/properties/{id}/rooms&#x60;), exactly as tiket.com sends it. Free-form text such as &#x60;DLX-KING&#x60;, so always a string — never parse it as a number. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketConnectRoomsResponseRoomsInner.new(
  room_id: null,
  room_name: null,
  max_guests: null,
  number_of_rooms: null,
  current_listing_id: null,
  room_booking_id: null
)
```

