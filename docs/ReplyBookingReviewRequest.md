# Repull::ReplyBookingReviewRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | Booking.com hotel/property id. |  |
| **review_id** | **String** | Booking.com review id (from &#x60;GET /v1/channels/booking/reviews&#x60;). |  |
| **response** | **String** | Public host reply text. |  |

## Example

```ruby
require 'repull'

instance = Repull::ReplyBookingReviewRequest.new(
  property_id: null,
  review_id: null,
  response: null
)
```

