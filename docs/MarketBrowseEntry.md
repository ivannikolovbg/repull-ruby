# Repull::MarketBrowseEntry

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **city** | **String** |  | [optional] |
| **country** | **String** | ISO 3166-1 alpha-2. | [optional] |
| **listings** | **Integer** | Atlas-tracked active comps in this city. | [optional] |
| **avg_adr** | **Float** |  | [optional] |
| **currency** | **String** | ISO 4217 currency derived from the country code. | [optional] |
| **subscribed** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketBrowseEntry.new(
  city: null,
  country: null,
  listings: null,
  avg_adr: null,
  currency: null,
  subscribed: null
)
```

