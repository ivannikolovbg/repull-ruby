# Repull::MarketSummary

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **city** | **String** |  | [optional] |
| **my_listings** | **Integer** |  | [optional] |
| **total_listings** | **Integer** | Atlas-tracked active comps in this city. | [optional] |
| **market_share_pct** | **Integer** |  | [optional] |
| **my_avg_adr** | **Float** |  | [optional] |
| **market_avg_adr** | **Float** |  | [optional] |
| **price_diff_pct** | **Integer** | (myAvgAdr - marketAvgAdr) / marketAvgAdr * 100, rounded. | [optional] |
| **my_avg_rating** | **Float** |  | [optional] |
| **market_avg_rating** | **Float** |  | [optional] |
| **my_occupancy_pct** | **Float** | Customer&#39;s 30-day forward occupancy %. | [optional] |
| **market_occupancy_pct** | **Float** |  | [optional] |
| **property_types** | **Integer** | Distinct property types Atlas has seen in this city. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketSummary.new(
  city: Radium Hot Springs,
  my_listings: null,
  total_listings: null,
  market_share_pct: null,
  my_avg_adr: null,
  market_avg_adr: null,
  price_diff_pct: null,
  my_avg_rating: null,
  market_avg_rating: null,
  my_occupancy_pct: null,
  market_occupancy_pct: null,
  property_types: null
)
```

