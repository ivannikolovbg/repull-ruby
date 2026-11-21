# Repull::AddVrboListingPhotosRequestPhotosInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** | An https JPEG or PNG Vrbo can download. | [optional] |
| **image** | **String** | Or: the image as base64 (a &#x60;data:image/jpeg;base64,&#x60; prefix is accepted). | [optional] |
| **caption** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AddVrboListingPhotosRequestPhotosInner.new(
  url: null,
  image: null,
  caption: null
)
```

