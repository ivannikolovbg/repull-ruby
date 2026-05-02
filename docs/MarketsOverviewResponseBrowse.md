# Repull::MarketsOverviewResponseBrowse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **featured** | [**Array&lt;MarketBrowseFeatured&gt;**](MarketBrowseFeatured.md) | Top ~50 markets by listing volume the customer doesn&#39;t already operate in. | [optional] |
| **categories** | [**Array&lt;MarketBrowseCategory&gt;**](MarketBrowseCategory.md) | Top 50 countries by tracked-city count. | [optional] |
| **total_available** | **Integer** | Total Atlas-tracked cities in the catalog. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketsOverviewResponseBrowse.new(
  featured: null,
  categories: null,
  total_available: null
)
```

