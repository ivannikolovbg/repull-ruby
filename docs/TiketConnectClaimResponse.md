# Repull::TiketConnectClaimResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **connected** | **Boolean** |  | [optional] |
| **connection_id** | **String** |  | [optional] |
| **hotel_id** | **String** |  | [optional] |
| **rooms** | **Integer** | Room types imported. | [optional] |
| **rate_plans** | **Integer** | Rate plans imported. | [optional] |
| **price_model** | **String** | &#x60;Room Based&#x60; (one &#x60;price&#x60; per night) or &#x60;Occupancy Based&#x60; (&#x60;occupancyPrices&#x60; per number of guests). Set per property in the tiket.com extranet. | [optional] |
| **currency** | **String** |  | [optional] |
| **auto_mapped** | **Integer** | Room types mapped automatically to a listing with the same name. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketConnectClaimResponse.new(
  connected: null,
  connection_id: null,
  hotel_id: null,
  rooms: null,
  rate_plans: null,
  price_model: Room Based,
  currency: null,
  auto_mapped: null
)
```

