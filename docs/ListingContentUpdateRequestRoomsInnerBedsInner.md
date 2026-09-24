# Repull::ListingContentUpdateRequestRoomsInnerBedsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bed_type** | **String** | e.g. &#x60;king_bed&#x60;, &#x60;queen_bed&#x60;, &#x60;double_bed&#x60;, &#x60;single_bed&#x60;, &#x60;sofa_bed&#x60;, &#x60;bunk_bed&#x60;. |  |
| **quantity** | **Integer** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateRequestRoomsInnerBedsInner.new(
  bed_type: queen_bed,
  quantity: null
)
```

