# Repull::ListListingUnits200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** | Repull listing id (numeric string, like every &#x60;*Id&#x60; on the wire). | [optional] |
| **total** | **Integer** |  | [optional] |
| **data** | [**Array&lt;ListListingUnits200ResponseDataInner&gt;**](ListListingUnits200ResponseDataInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListListingUnits200Response.new(
  listing_id: null,
  total: null,
  data: null
)
```

