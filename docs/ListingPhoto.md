# Repull::ListingPhoto

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** | Public URL for the photo. | [optional] |
| **path** | **String** | Storage path — pass to &#x60;DELETE /v1/listings/{id}/photos&#x60; to remove this photo. | [optional] |
| **size** | **Integer** | File size in bytes. | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPhoto.new(
  url: null,
  path: null,
  size: null,
  created_at: null
)
```

