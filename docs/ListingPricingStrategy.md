# Repull::ListingPricingStrategy

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **customer_id** | **String** |  | [optional] |
| **mode** | **String** | &#x60;recommend&#x60; surfaces suggestions; &#x60;auto&#x60; applies them on the next sync. | [optional] |
| **min_price** | **Float** |  | [optional] |
| **max_price** | **Float** |  | [optional] |
| **max_daily_change_pct** | **Float** | Max day-over-day swing in %. | [optional][default to 15] |
| **weekend_markup_pct** | **Float** | % bump applied on Fri/Sat. | [optional] |
| **day_of_week_multipliers** | **Hash&lt;String, Float&gt;** | Multiplier per ISO weekday key (0..6). | [optional] |
| **target_occupancy_pct** | **Float** |  | [optional] |
| **target_monthly_revenue** | **Float** |  | [optional] |
| **owner_min_monthly_payout** | **Float** |  | [optional] |
| **comp_position_target** | **String** |  | [optional][default to &#39;match&#39;] |
| **comp_adjust_pct** | **Float** | Extra adjustment vs comp median (-30..+30). | [optional][default to 0] |
| **event_boost_enabled** | **Boolean** |  | [optional][default to true] |
| **event_boost_max_pct** | **Float** |  | [optional][default to 30] |
| **is_default** | **Boolean** | true when no row exists yet and the response is server-side defaults. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPricingStrategy.new(
  id: null,
  listing_id: null,
  customer_id: null,
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
  event_boost_max_pct: null,
  is_default: null
)
```

