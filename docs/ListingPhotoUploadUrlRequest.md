# Repull::ListingPhotoUploadUrlRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file_name** | **String** | Original file name, e.g. \&quot;living-room.jpg\&quot;. |  |
| **file_type** | **String** | Image MIME type. Must start with \&quot;image/\&quot;. |  |
| **file_size** | **Integer** | File size in bytes. Required: the signed upload is issued for this size. |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingPhotoUploadUrlRequest.new(
  file_name: living-room.jpg,
  file_type: image/jpeg,
  file_size: 453631
)
```

