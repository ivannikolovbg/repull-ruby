# Repull::ListingPhotoUploadUrlRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file_name** | **String** | Original file name, e.g. \&quot;living-room.jpg\&quot;. |  |
| **file_type** | **String** | Image MIME type. Must start with \&quot;image/\&quot;. |  |
| **file_size** | **Integer** | File size in bytes, when known. Must be positive if provided. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPhotoUploadUrlRequest.new(
  file_name: living-room.jpg,
  file_type: image/jpeg,
  file_size: null
)
```

