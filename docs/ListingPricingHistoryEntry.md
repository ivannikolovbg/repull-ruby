# Repull::ListingPricingHistoryEntry

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** |  | [optional] |
| **recommended_rate** | **Float** | The Atlas model&#39;s recommended price for the date. | [optional] |
| **applied_rate** | **Float** | Price actually written to the calendar. &#x60;null&#x60; when status is &#x60;pending&#x60; or &#x60;declined&#x60;. For now, when &#x60;status&#x3D;applied&#x60; this equals &#x60;recommended_rate&#x60; because the apply path writes the recommendation verbatim. | [optional] |
| **status** | **String** | &#x60;overridden&#x60; is reserved for a future signal — it never appears today. | [optional] |
| **recommendation_factors** | **Hash&lt;String, Object&gt;** | Raw model factors (comp distance, event boost, weekend, demand, etc.). | [optional] |
| **applied_at** | **Time** |  | [optional] |
| **applied_by** | **String** | Who applied it (e.g. &#x60;auto&#x60;, &#x60;api&#x60;, &#x60;user&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPricingHistoryEntry.new(
  date: null,
  recommended_rate: null,
  applied_rate: null,
  status: null,
  recommendation_factors: null,
  applied_at: null,
  applied_by: null
)
```

