# Repull::ListingActiveResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The listing id (id fields are serialized as strings to preserve precision). | [optional] |
| **active** | **Boolean** | The resulting active state after the toggle. | [optional] |
| **booking_properties** | [**Array&lt;BookingPropertyOpenResult&gt;**](BookingPropertyOpenResult.md) | Only when activating: what happened to the Booking.com properties this listing is mapped to. Activating a listing opens its Booking.com property if Booking.com still has it in a build stage. Empty when the listing has no Booking.com property. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingActiveResponse.new(
  id: null,
  active: null,
  booking_properties: null
)
```

