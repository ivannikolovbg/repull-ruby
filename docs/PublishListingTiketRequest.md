# Repull::PublishListingTiketRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | tiket.com Hotel ID — only needed when the listing is mapped on more than one tiket.com property. Also accepted as &#x60;?hotel_id&#x3D;&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PublishListingTiketRequest.new(
  hotel_id: null
)
```

