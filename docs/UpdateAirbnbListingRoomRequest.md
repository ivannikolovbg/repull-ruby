# Repull::UpdateAirbnbListingRoomRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_number** | **Integer** | The room&#39;s position among the listing&#39;s rooms. Airbnb keys rooms of the same type by this number, so two bedrooms are 1 and 2. | [optional] |
| **room_type** | **String** |  | [optional] |
| **beds** | [**Array&lt;UpdateAirbnbListingRoomRequestBedsInner&gt;**](UpdateAirbnbListingRoomRequestBedsInner.md) | The room&#39;s whole sleeping arrangement. Replaces what is there — send every bed, not just the changed one. | [optional] |
| **room_amenities** | [**Array&lt;UpdateAirbnbListingRoomRequestRoomAmenitiesInner&gt;**](UpdateAirbnbListingRoomRequestRoomAmenitiesInner.md) | Amenities attached to this room, not to the listing. | [optional] |
| **is_private** | **Boolean** |  | [optional] |
| **metadata** | **Hash&lt;String, Object&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbListingRoomRequest.new(
  room_number: null,
  room_type: null,
  beds: null,
  room_amenities: null,
  is_private: null,
  metadata: null
)
```

