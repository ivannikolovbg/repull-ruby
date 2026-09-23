# Repull::ListingMarketStateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | Booking.com property to act on, for a listing mapped to more than one. Without it the Booking.com item comes back refused with &#x60;ambiguous_booking_mapping&#x60; — closing the wrong property&#39;s availability takes real inventory off sale, so it is never guessed. The Airbnb items are unaffected and still run. &#x60;GET /v1/channels/booking/properties&#x60; lists every property in the workspace with the listings mapped under it. &#x60;?hotel_id&#x3D;&#x60; in the query string means the same thing; the body wins if you send both. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingMarketStateRequest.new(
  hotel_id: null
)
```

