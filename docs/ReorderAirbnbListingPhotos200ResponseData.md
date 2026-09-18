# Repull::ReorderAirbnbListingPhotos200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order** | [**Array&lt;AirbnbPhotoPosition&gt;**](AirbnbPhotoPosition.md) | The resulting tour order, including photos you did not name. | [optional] |
| **applied** | [**Array&lt;AirbnbPhotoPosition&gt;**](AirbnbPhotoPosition.md) | The photos this call actually moved. | [optional] |
| **unchanged** | **Integer** | Photos that were already in the right position. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReorderAirbnbListingPhotos200ResponseData.new(
  order: null,
  applied: null,
  unchanged: null
)
```

