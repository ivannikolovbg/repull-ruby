# Repull::BookingRoomsRatesResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | Booking.com hotel/property id the rooms belong to. | [optional] |
| **listing_id** | **Integer** | Vanio listing id echoed back. | [optional] |
| **rooms** | [**Array&lt;BookingRoomsRatesResponseRoomsInner&gt;**](BookingRoomsRatesResponseRoomsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRoomsRatesResponse.new(
  hotel_id: null,
  listing_id: null,
  rooms: null
)
```

