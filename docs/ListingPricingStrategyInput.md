# Repull::ListingPricingStrategyInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **mode** | **String** |  | [optional] |
| **min_price** | **Float** |  | [optional] |
| **max_price** | **Float** |  | [optional] |
| **max_daily_change_pct** | **Float** |  | [optional] |
| **weekend_markup_pct** | **Float** |  | [optional] |
| **day_of_week_multipliers** | **Hash&lt;String, Float&gt;** |  | [optional] |
| **target_occupancy_pct** | **Float** |  | [optional] |
| **target_monthly_revenue** | **Float** |  | [optional] |
| **owner_min_monthly_payout** | **Float** |  | [optional] |
| **comp_position_target** | **String** |  | [optional] |
| **comp_adjust_pct** | **Float** |  | [optional] |
| **event_boost_enabled** | **Boolean** |  | [optional] |
| **event_boost_max_pct** | **Float** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPricingStrategyInput.new(
  mode: null,
  min_price: null,
  max_price: null,
  max_daily_change_pct: null,
  weekend_markup_pct: null,
  day_of_week_multipliers: null,
  target_occupancy_pct: null,
  target_monthly_revenue: null,
  owner_min_monthly_payout: null,
  comp_position_target: null,
  comp_adjust_pct: null,
  event_boost_enabled: null,
  event_boost_max_pct: null
)
```

