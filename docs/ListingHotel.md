# Repull::ListingHotel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A Repull hotel id, or &#x60;booking:&lt;hotelId&gt;&#x60; for a Booking.com property. | [optional] |
| **name** | **String** |  | [optional] |
| **source** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingHotel.new(
  id: booking:255832,
  name: null,
  source: null
)
```

