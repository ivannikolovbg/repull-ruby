# Repull::BookingPropertyActionResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **channel** | **String** |  |  |
| **action** | **String** |  |  |
| **hotel_id** | **String** | The Booking.com property that was acted on. Always read it back — a listing can be mapped to several, and this states which one changed. |  |
| **room_booking_id** | **String** | Booking.com&#39;s own room id the availability write addressed. | [optional] |
| **selling** | **Boolean** | Whether the property is now on sale. **This is the state of the property on Booking.com, not of the listing in Repull** — &#x60;active&#x60; (what Repull bills and serves) is untouched by both actions and is deliberately not echoed here so the two can never be read as one field. |  |

## Example

```ruby
require 'repull'

instance = Repull::BookingPropertyActionResponse.new(
  listing_id: null,
  channel: null,
  action: null,
  hotel_id: null,
  room_booking_id: null,
  selling: null
)
```

