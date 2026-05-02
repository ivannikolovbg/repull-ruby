# Repull::MarketBrowseFeatured

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **city** | **String** |  | [optional] |
| **country** | **String** | ISO 3166-1 alpha-2. | [optional] |
| **listings** | **Integer** | Atlas-tracked active comps in this city. | [optional] |
| **avg_adr** | **Float** | Atlas-aggregated avg nightly rate (mixed currency, dominated by the country base). | [optional] |
| **subscribed** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketBrowseFeatured.new(
  city: null,
  country: null,
  listings: null,
  avg_adr: null,
  subscribed: null
)
```

