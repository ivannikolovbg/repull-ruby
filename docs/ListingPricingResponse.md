# Repull::ListingPricingResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** |  | [optional] |
| **date_range** | [**ListingPricingResponseDateRange**](ListingPricingResponseDateRange.md) |  | [optional] |
| **recommendations** | [**Array&lt;ListingPricingRecommendation&gt;**](ListingPricingRecommendation.md) |  | [optional] |
| **listing** | [**ListingPricingResponseListing**](ListingPricingResponseListing.md) |  | [optional] |
| **comp_summary** | [**ListingPricingResponseCompSummary**](ListingPricingResponseCompSummary.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPricingResponse.new(
  listing_id: null,
  date_range: null,
  recommendations: null,
  listing: null,
  comp_summary: null
)
```

