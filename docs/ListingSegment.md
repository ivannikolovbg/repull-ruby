# Repull::ListingSegment

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **share_pct** | **Float** | Percent of analyzed comps in the scope that fall in this segment. | [optional] |
| **sample_size** | **Integer** |  | [optional] |
| **avg_adr_in_segment** | **Float** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **quality_tier** | **String** |  | [optional] |
| **design_style** | **String** | Decomposed style token (e.g. &#x60;modern&#x60;, &#x60;mid-century&#x60;). | [optional] |
| **bedrooms** | **Integer** | Decomposed bedroom count. &#x60;0&#x60; indicates studio. | [optional] |
| **my_listing_match** | **Boolean** | True when the source listing&#39;s &#x60;ai_segment&#x60; matches this segment. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingSegment.new(
  name: upscale-modern-2br,
  share_pct: null,
  sample_size: null,
  avg_adr_in_segment: null,
  currency: null,
  quality_tier: null,
  design_style: null,
  bedrooms: null,
  my_listing_match: null
)
```

