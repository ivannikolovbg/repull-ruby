# Repull::MarketDetailResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **city** | **String** |  | [optional] |
| **price_distribution** | [**Array&lt;MarketDetailResponsePriceDistributionInner&gt;**](MarketDetailResponsePriceDistributionInner.md) |  | [optional] |
| **bedroom_breakdown** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **property_type_mix** | [**Array&lt;MarketDetailResponsePropertyTypeMixInner&gt;**](MarketDetailResponsePropertyTypeMixInner.md) |  | [optional] |
| **events** | [**Array&lt;MarketEvent&gt;**](MarketEvent.md) |  | [optional] |
| **wheelhouse_trends** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **benchmarks** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **health_summary** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **top_comps** | [**MarketDetailResponseTopComps**](MarketDetailResponseTopComps.md) |  | [optional] |
| **market_position** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **capacity_gap** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **supply_trend** | [**Array&lt;MarketDetailResponseSupplyTrendInner&gt;**](MarketDetailResponseSupplyTrendInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketDetailResponse.new(
  city: null,
  price_distribution: null,
  bedroom_breakdown: null,
  property_type_mix: null,
  events: null,
  wheelhouse_trends: null,
  benchmarks: null,
  health_summary: null,
  top_comps: null,
  market_position: null,
  capacity_gap: null,
  supply_trend: null
)
```

