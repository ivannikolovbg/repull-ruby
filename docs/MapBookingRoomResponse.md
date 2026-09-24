# Repull::MapBookingRoomResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Boolean** |  |  |
| **already_mapped** | **Boolean** | True when the room already pointed at this listing (or was already unmapped) and its channel link agreed. Nothing was written. |  |
| **room_booking_id** | **String** | Booking.com&#39;s room id, as recorded for this room. |  |
| **listing_id** | **String** | The listing the room now points at. Null after an unmap. |  |
| **previous_listing_id** | **String** | The listing the room pointed at before this call; null when it was unmapped. Omitted on a no-op. | [optional] |
| **hotel_id** | **String** | The Booking.com property the room belongs to. |  |
| **room_id** | **String** | Repull-side id of the room record — the &#x60;roomId&#x60; the Connect room-mapping flow takes. |  |
| **room_name** | **String** |  | [optional] |
| **platform_link_id** | **String** | Id of the resulting channel-link row. Null after an unmap, and for a room Booking.com has given us no room id for. | [optional] |
| **reservations_imported** | **Integer** | Reservations Booking.com returned for the property and ran through the import after the room was mapped — the property&#39;s active bookings, which would otherwise never reach the listing. A reservation already present is left as it is, so this counts what was processed, not what was new, and re-sending never duplicates. Runs on every successful map, including a re-map to the same listing, so re-sending retries an import that did not run. &#x60;null&#x60; means the mapping succeeded but the import could not run; the room is still mapped. Absent after an unmap, when there is nothing to pull. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MapBookingRoomResponse.new(
  success: true,
  already_mapped: null,
  room_booking_id: null,
  listing_id: null,
  previous_listing_id: null,
  hotel_id: null,
  room_id: null,
  room_name: null,
  platform_link_id: null,
  reservations_imported: null
)
```

