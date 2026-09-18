# Repull::UploadAirbnbListingPhotosRequestPhotosInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **image** | **String** | Base64 image data. A &#x60;data:image/jpeg;base64,&#x60; prefix is accepted and stripped. Maximum 25 MB decoded. |  |
| **listing_id** | [**UploadAirbnbListingPhotosRequestPhotosInnerListingId**](UploadAirbnbListingPhotosRequestPhotosInnerListingId.md) |  | [optional] |
| **room_id** | **String** | Airbnb room id to file this photo under (&#x60;roomId&#x60; from &#x60;GET /rooms&#x60;). | [optional] |
| **category** | **String** |  | [optional] |
| **amenity** | **String** | Amenity id, when &#x60;category&#x60; is &#x60;listing_amenity&#x60; or &#x60;room_amenity&#x60;. | [optional] |
| **caption** | **String** |  | [optional] |
| **sort_order** | **Integer** |  | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | At most 10 pairs; keys 40 characters or fewer. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UploadAirbnbListingPhotosRequestPhotosInner.new(
  image: null,
  listing_id: null,
  room_id: null,
  category: null,
  amenity: null,
  caption: null,
  sort_order: null,
  metadata: null
)
```

