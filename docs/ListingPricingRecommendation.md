# Repull::ListingPricingRecommendation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** |  | [optional] |
| **current_price** | **Float** | Current calendar price (from Vanio listings_calendar_days) before applying the recommendation. | [optional] |
| **recommended_price** | **Float** | Atlas model&#39;s recommended price. | [optional] |
| **min_price** | **Float** |  | [optional] |
| **max_price** | **Float** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **confidence** | **Float** | Model confidence in [0, 1]. | [optional] |
| **booking_probability** | **Float** | Expected booking probability for the date at the recommended price. | [optional] |
| **expected_revenue** | **Float** |  | [optional] |
| **factors** | **Hash&lt;String, Object&gt;** | Free-form JSON of model factors (comp distance, event boost, weekend, demand, etc.). | [optional] |
| **status** | **String** | Lifecycle state. | [optional] |
| **model_version** | **String** |  | [optional] |
| **generated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPricingRecommendation.new(
  date: Thu May 14 00:00:00 UTC 2026,
  current_price: null,
  recommended_price: null,
  min_price: null,
  max_price: null,
  currency: USD,
  confidence: null,
  booking_probability: null,
  expected_revenue: null,
  factors: null,
  status: null,
  model_version: null,
  generated_at: null
)
```

