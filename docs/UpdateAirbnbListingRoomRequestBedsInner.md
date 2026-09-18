# Repull::UpdateAirbnbListingRoomRequestBedsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Airbnb bed type, lowercase snake_case. Seen on live listings: king_bed, queen_bed, double_bed, small_double_bed, single_bed, bunk_bed, sofa_bed, couch, air_mattress, floor_mattress, toddler_bed, crib, hammock. Not a closed enum here — Airbnb&#39;s vocabulary drifts, so an unknown type is refused by Airbnb with its own message rather than by us. |  |
| **quantity** | **Integer** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbListingRoomRequestBedsInner.new(
  type: null,
  quantity: null
)
```

