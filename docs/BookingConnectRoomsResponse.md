# Repull::BookingConnectRoomsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | &#x60;importing&#x60; — listings_booking row exists but rooms not yet imported. &#x60;ready&#x60; — rooms imported, awaiting mapping. &#x60;completed&#x60; — session already finished. |  |
| **session_id** | **String** |  |  |
| **hotel_id** | **String** |  |  |
| **rooms** | [**Array&lt;BookingConnectRoom&gt;**](BookingConnectRoom.md) |  |  |
| **listing_options** | [**Array&lt;BookingConnectListingOption&gt;**](BookingConnectListingOption.md) |  |  |
| **missing_capabilities** | **Array&lt;String&gt;** | Capabilities Booking.com explicitly refused for this property, usually empty. &#x60;content&#x60; means reservations, availability and messaging sync normally, but the Content API was never granted — so room names and photos are placeholders, and nightly prices cannot be published until the grant is added (the currency is unknown and is never guessed). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingConnectRoomsResponse.new(
  status: null,
  session_id: null,
  hotel_id: null,
  rooms: null,
  listing_options: null,
  missing_capabilities: null
)
```

