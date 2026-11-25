# Repull::TiketListingPricingResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **property_id** | **String** | tiket.com Hotel ID. |  |
| **room_type_code** | **String** | The tiket.com room type the listing is mapped to. |  |
| **price_model** | **String** | &#x60;Room Based&#x60; (one &#x60;price&#x60; per night) or &#x60;Occupancy Based&#x60; (&#x60;occupancyPrices&#x60; per number of guests). Set per property in the tiket.com extranet. | [optional] |
| **currency** | **String** |  | [optional] |
| **start** | **Date** |  |  |
| **_end** | **Date** | Inclusive. |  |
| **days** | [**Array&lt;TiketAriDay&gt;**](TiketAriDay.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::TiketListingPricingResponse.new(
  listing_id: null,
  property_id: null,
  room_type_code: null,
  price_model: Room Based,
  currency: IDR,
  start: null,
  _end: null,
  days: null
)
```

