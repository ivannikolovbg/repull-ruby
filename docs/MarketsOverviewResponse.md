# Repull::MarketsOverviewResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;MarketSummary&gt;**](MarketSummary.md) | Per-city KPIs for every market the customer operates in. | [optional] |
| **pagination** | [**Pagination**](Pagination.md) |  | [optional] |
| **totals** | [**MarketsOverviewResponseTotals**](MarketsOverviewResponseTotals.md) |  | [optional] |
| **my_listings** | [**Array&lt;MarketMyListing&gt;**](MarketMyListing.md) |  | [optional] |
| **free_market** | **String** | City auto-assigned as the customer&#39;s free market (largest by listing count). Null for customers with no listings. | [optional] |
| **subscriptions** | [**MarketsOverviewResponseSubscriptions**](MarketsOverviewResponseSubscriptions.md) |  | [optional] |
| **tier** | **String** | Resolved Repull tier (free / starter / custom). | [optional] |
| **browse** | [**MarketsOverviewResponseBrowse**](MarketsOverviewResponseBrowse.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketsOverviewResponse.new(
  data: null,
  pagination: null,
  totals: null,
  my_listings: null,
  free_market: null,
  subscriptions: null,
  tier: null,
  browse: null
)
```

