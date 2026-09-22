# Repull::BookingPropertyListingsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** | Repull listing id — what &#x60;/v1/channels/booking/properties/{id}&#x60; and &#x60;/v1/channels/booking/listings/{id}/pricing&#x60; take. | [optional] |
| **name** | **String** |  | [optional] |
| **city** | **String** |  | [optional] |
| **room_id** | **String** | Repull-side room row id, as used by &#x60;POST /v1/connect/booking/map-rooms&#x60;. | [optional] |
| **room_booking_id** | **String** | Booking.com&#39;s own room id — the &#x60;roomId&#x60; an ARI write takes. | [optional] |
| **room_name** | **String** |  | [optional] |
| **mapped_via** | **String** | Which record carries the mapping: the room mapping written by Connect, or the legacy property-level link. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPropertyListingsInner.new(
  listing_id: null,
  name: null,
  city: null,
  room_id: null,
  room_booking_id: null,
  room_name: null,
  mapped_via: null
)
```

