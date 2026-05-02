# Repull::ListingSegmentsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** |  | [optional] |
| **level** | **String** |  | [optional] |
| **scope** | [**ListingSegmentsResponseScope**](ListingSegmentsResponseScope.md) |  | [optional] |
| **my_segment** | **String** | The source listing&#39;s own &#x60;ai_segment&#x60; (or null if not yet scored). | [optional] |
| **my_quality_tier** | **String** |  | [optional] |
| **total_comps_analyzed** | **Integer** | Number of comps in scope that have a DNA score. &#x60;0&#x60; is a coverage signal, not an error. | [optional] |
| **segments** | [**Array&lt;ListingSegment&gt;**](ListingSegment.md) |  | [optional] |
| **quality_tiers** | [**Array&lt;ListingQualityTier&gt;**](ListingQualityTier.md) |  | [optional] |
| **recommendations** | [**Array&lt;ListingSegmentRecommendation&gt;**](ListingSegmentRecommendation.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingSegmentsResponse.new(
  listing_id: null,
  level: null,
  scope: null,
  my_segment: null,
  my_quality_tier: null,
  total_comps_analyzed: null,
  segments: null,
  quality_tiers: null,
  recommendations: null
)
```

