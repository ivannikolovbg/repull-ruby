# Repull::GetUsageSummary200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tier** | **String** |  | [optional] |
| **limits** | [**GetUsageSummary200ResponseLimits**](GetUsageSummary200ResponseLimits.md) |  | [optional] |
| **used** | [**GetUsageSummary200ResponseUsed**](GetUsageSummary200ResponseUsed.md) |  | [optional] |
| **remaining** | [**GetUsageSummary200ResponseRemaining**](GetUsageSummary200ResponseRemaining.md) |  | [optional] |
| **resets_at** | **Time** |  | [optional] |
| **breakdown** | [**Array&lt;GetUsageSummary200ResponseBreakdownInner&gt;**](GetUsageSummary200ResponseBreakdownInner.md) |  | [optional] |
| **timeline** | [**Array&lt;GetUsageSummary200ResponseTimelineInner&gt;**](GetUsageSummary200ResponseTimelineInner.md) |  | [optional] |
| **status_distribution** | [**GetUsageSummary200ResponseStatusDistribution**](GetUsageSummary200ResponseStatusDistribution.md) |  | [optional] |
| **totals** | [**GetUsageSummary200ResponseTotals**](GetUsageSummary200ResponseTotals.md) |  | [optional] |
| **range** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetUsageSummary200Response.new(
  tier: null,
  limits: null,
  used: null,
  remaining: null,
  resets_at: null,
  breakdown: null,
  timeline: null,
  status_distribution: null,
  totals: null,
  range: null
)
```

