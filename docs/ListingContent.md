# Repull::ListingContent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **title** | **String** | Public listing title. Populated only by &#x60;generate-content&#x60;; not stored on &#x60;listings_descriptions&#x60;. | [optional] |
| **summary** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **space** | **String** |  | [optional] |
| **guest_access** | **String** |  | [optional] |
| **neighborhood_overview** | **String** |  | [optional] |
| **getting_around** | **String** | Free-text directions for getting to + around the property (e.g. \&quot;Take Highway 95 north for 12 miles\&quot;). | [optional] |
| **transit** | **String** |  | [optional] |
| **house_rules** | **String** |  | [optional] |
| **additional_rules** | **Object** | Structured supplementary rules (JSON; shape evolves with the listings_descriptions schema). | [optional] |
| **notes** | **String** |  | [optional] |
| **interaction_with_guests** | **String** | Host’s description of how they engage with guests (e.g. \&quot;Self check-in, available via message\&quot;). | [optional] |
| **amenities** | **Array&lt;String&gt;** | Free-text amenity strings. Populated only by &#x60;generate-content&#x60;; the &#x60;?include&#x3D;amenities&#x60; expansion returns the structured &#x60;ListingAmenity[]&#x60; instead. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContent.new(
  title: null,
  summary: null,
  description: null,
  space: null,
  guest_access: null,
  neighborhood_overview: null,
  getting_around: null,
  transit: null,
  house_rules: null,
  additional_rules: null,
  notes: null,
  interaction_with_guests: null,
  amenities: null
)
```

