# Repull::SetAirbnbListingCoverPhoto200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cover_photo_id** | **String** |  | [optional] |
| **applied** | [**Array&lt;AirbnbPhotoPosition&gt;**](AirbnbPhotoPosition.md) | The photos this call actually moved. Empty when the photo was already the cover. | [optional] |
| **order** | [**Array&lt;AirbnbPhotoPosition&gt;**](AirbnbPhotoPosition.md) | Present only when the whole tour had to be renumbered. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SetAirbnbListingCoverPhoto200ResponseData.new(
  cover_photo_id: null,
  applied: null,
  order: null
)
```

