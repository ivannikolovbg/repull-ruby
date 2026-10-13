# Repull::GetHotel200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A Repull hotel id, or &#x60;booking:&lt;hotelId&gt;&#x60; for a Booking.com property. | [optional] |
| **name** | **String** |  | [optional] |
| **source** | **String** | &#x60;pms&#x60;: a hotel PMS (Cloudbeds, Mews) owns rooms and room counts. &#x60;booking&#x60;: a Booking.com property; room counts are the room count on Booking.com. | [optional] |
| **provider** | **String** |  | [optional] |
| **city** | **String** |  | [optional] |
| **room_type_count** | **Integer** |  | [optional] |
| **unit_count** | **Integer** | Rooms across all room types. | [optional] |
| **room_types** | [**Array&lt;GetHotel200ResponseRoomTypesInner&gt;**](GetHotel200ResponseRoomTypesInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetHotel200Response.new(
  id: 30910,
  name: null,
  source: null,
  provider: cloudbeds,
  city: null,
  room_type_count: null,
  unit_count: null,
  room_types: null
)
```

