# Repull::ListingCompsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** |  | [optional] |
| **date_range** | [**ListingPricingResponseDateRange**](ListingPricingResponseDateRange.md) |  | [optional] |
| **radius_km** | **Float** |  | [optional] |
| **total** | **Integer** |  | [optional] |
| **data** | [**Array&lt;ListingComp&gt;**](ListingComp.md) |  | [optional] |
| **warning** | **String** | Present (and &#x60;data&#x60; empty) when the source listing has no coordinates. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingCompsResponse.new(
  listing_id: null,
  date_range: null,
  radius_km: null,
  total: null,
  data: null,
  warning: null
)
```

