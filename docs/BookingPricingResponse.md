# Repull::BookingPricingResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **other_hotel_ids** | **Array&lt;String&gt;** | Other Booking.com properties this listing is also published under. Empty in the normal case. Pass one as &#x60;?hotel_id&#x3D;&#x60; to read its pricing instead. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPricingResponse.new(
  hotel_id: null,
  listing_id: null,
  other_hotel_ids: null
)
```

