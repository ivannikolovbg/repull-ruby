# Repull::AccountUnitsAddedPayloadUnitsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unit_id** | **String** | The &#x60;unit_id&#x60; to pass to &#x60;POST /v1/connections/{id}/mappings&#x60;. |  |
| **name** | **String** |  |  |
| **hotel_id** | **String** | Booking.com property ID. |  |
| **room_id** | **String** | Booking.com room ID. |  |
| **mapped** | **Boolean** | Whether the unit is already mapped to a listing. New units are almost always unmapped: their bookings, messages and reviews import once you map them. |  |
| **listing_id** | **Integer** | The listing the unit is mapped to, when &#x60;mapped&#x60;. |  |

## Example

```ruby
require 'repull'

instance = Repull::AccountUnitsAddedPayloadUnitsInner.new(
  unit_id: null,
  name: null,
  hotel_id: null,
  room_id: null,
  mapped: null,
  listing_id: null
)
```

