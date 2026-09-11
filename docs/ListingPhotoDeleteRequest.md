# Repull::ListingPhotoDeleteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **path** | **String** | Storage path of the photo to delete, as returned by &#x60;GET /v1/listings/{id}/photos&#x60; or the &#x60;upload-url&#x60; response. |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingPhotoDeleteRequest.new(
  path: null
)
```

