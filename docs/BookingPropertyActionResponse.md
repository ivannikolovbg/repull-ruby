# Repull::BookingPropertyActionResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **channel** | **String** |  |  |
| **action** | **String** |  |  |
| **property_status** | **String** | &#x60;open&#x60; / &#x60;close&#x60; only: the property&#39;s state on Booking.com after the call. | [optional] |
| **changed** | **Boolean** | &#x60;open&#x60; / &#x60;close&#x60; only: false when the property was already in that state, so nothing was sent. | [optional] |
| **booking_status** | **String** | &#x60;open&#x60; / &#x60;close&#x60; only: Booking.com&#39;s status for the property before the call, e.g. &#x60;XML: Ready to open&#x60;. | [optional] |
| **hotel_id** | **String** | The Booking.com property that was acted on. Always read it back — a listing can be mapped to several, and this states which one changed. |  |
| **room_booking_id** | **String** | Booking.com&#39;s own room id the availability write addressed. | [optional] |
| **selling** | **Boolean** | &#x60;unlist&#x60; / &#x60;relist&#x60; only. Whether the property is now on sale. **This is the state of the property on Booking.com, not of the listing in Repull** — &#x60;active&#x60; (what Repull bills and serves) is untouched by both actions and is deliberately not echoed here so the two can never be read as one field. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPropertyActionResponse.new(
  listing_id: null,
  channel: null,
  action: null,
  property_status: null,
  changed: null,
  booking_status: null,
  hotel_id: null,
  room_booking_id: null,
  selling: null
)
```

