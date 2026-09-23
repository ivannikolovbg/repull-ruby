# Repull::ListingPublishBookingRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | Booking.com property to publish into. Required when this listing is mapped to more than one — without it the push is refused with &#x60;409 ambiguous_booking_mapping&#x60; rather than written into a property chosen for you. &#x60;GET /v1/channels/booking/properties&#x60; lists every property in the workspace with the listings mapped under it. &#x60;?hotel_id&#x3D;&#x60; in the query string is accepted as well and means the same thing; the body wins if you send both. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPublishBookingRequest.new(
  hotel_id: null
)
```

