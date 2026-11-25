# Repull::TiketContentResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** |  | [optional] |
| **partner_hotel_code** | **String** |  | [optional] |
| **chain_code** | **String** |  | [optional] |
| **content_mapped** | **Boolean** |  | [optional] |
| **activation_status** | **String** | Same as on &#x60;GET /v1/channels/tiket/properties&#x60;. | [optional] |
| **objects** | [**Array&lt;TiketContentResponseObjectsInner&gt;**](TiketContentResponseObjectsInner.md) | One entry per content object Repull sent: the property, each room type, each rate plan. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketContentResponse.new(
  property_id: null,
  partner_hotel_code: null,
  chain_code: null,
  content_mapped: null,
  activation_status: null,
  objects: null
)
```

