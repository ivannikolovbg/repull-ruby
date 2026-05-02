# Repull::ListingSegmentRecommendation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **kind** | **String** | Stable identifier for the recommendation kind. SDKs can switch on this safely. | [optional] |
| **message** | **String** |  | [optional] |
| **evidence** | **Hash&lt;String, Object&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingSegmentRecommendation.new(
  kind: null,
  message: null,
  evidence: null
)
```

