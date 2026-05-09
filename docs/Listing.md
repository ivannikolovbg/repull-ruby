# Repull::Listing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id | [optional] |
| **name** | **String** |  | [optional] |
| **address** | [**ListingAddress**](ListingAddress.md) |  | [optional] |
| **thumbnail_url** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **channels** | [**Array&lt;ListingChannel&gt;**](ListingChannel.md) | Channels (Airbnb, Booking, VRBO, etc.) the listing is connected to. | [optional] |
| **amenities** | [**Array&lt;ListingAmenity&gt;**](ListingAmenity.md) | Amenity rows for the listing. **Only present when the caller passes &#x60;?include&#x3D;amenities&#x60;.** Empty array (&#x60;[]&#x60;) when the listing has no amenity rows. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Listing.new(
  id: null,
  name: I - Stafford Apartment,
  address: null,
  thumbnail_url: null,
  status: null,
  channels: null,
  amenities: null,
  created_at: null,
  updated_at: null
)
```

