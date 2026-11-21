# Repull::UpdateVrboListingPhotosRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **add** | [**Array&lt;UpdateVrboListingPhotosRequestAddInner&gt;**](UpdateVrboListingPhotosRequestAddInner.md) |  | [optional] |
| **delete** | **Array&lt;String&gt;** |  | [optional] |
| **captions** | **Hash&lt;String, String&gt;** | &#x60;{photoId: caption}&#x60; | [optional] |
| **order** | **Array&lt;String&gt;** |  | [optional] |
| **cover** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingPhotosRequest.new(
  add: null,
  delete: null,
  captions: null,
  order: null,
  cover: null
)
```

