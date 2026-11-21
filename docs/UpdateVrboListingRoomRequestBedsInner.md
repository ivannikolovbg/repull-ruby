# Repull::UpdateVrboListingRoomRequestBedsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Airbnb&#39;s bed words (king_bed, queen_bed, double_bed, single_bed, bunk_bed, sofa_bed, couch, toddler_bed, crib) or Vrbo&#39;s (KING_BED, FUTON, MURPHY_BED, …). |  |
| **size** | **String** | Vrbo&#39;s size, for beds that come in several (BUNK_BED, SOFA_BED, FUTON, MURPHY_BED). Defaults to the usual one. | [optional] |
| **quantity** | **Integer** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingRoomRequestBedsInner.new(
  type: king_bed,
  size: KING,
  quantity: null
)
```

