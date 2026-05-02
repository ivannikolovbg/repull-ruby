# Repull::MarketCalendarDay

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** |  | [optional] |
| **market_avg_rate** | **Float** |  | [optional] |
| **market_min_rate** | **Float** |  | [optional] |
| **market_max_rate** | **Float** |  | [optional] |
| **priced_listings** | **Integer** |  | [optional] |
| **occupancy_pct** | **Float** |  | [optional] |
| **total_listings** | **Integer** |  | [optional] |
| **wheelhouse_occupancy** | **Float** |  | [optional] |
| **wheelhouse_adr** | **Float** |  | [optional] |
| **events** | [**Array&lt;MarketCalendarDayEventsInner&gt;**](MarketCalendarDayEventsInner.md) |  | [optional] |
| **my_price** | **Float** | Only present when &#x60;listingId&#x60; is supplied. | [optional] |
| **my_available** | **Boolean** | Only meaningful when &#x60;listingId&#x60; is supplied. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketCalendarDay.new(
  date: null,
  market_avg_rate: null,
  market_min_rate: null,
  market_max_rate: null,
  priced_listings: null,
  occupancy_pct: null,
  total_listings: null,
  wheelhouse_occupancy: null,
  wheelhouse_adr: null,
  events: null,
  my_price: null,
  my_available: null
)
```

