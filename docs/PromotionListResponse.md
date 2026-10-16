# Repull::PromotionListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;Promotion&gt;**](Promotion.md) |  | [optional] |
| **synced_at** | **Time** | When the channels were last read for this listing. | [optional] |
| **sync_error** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionListResponse.new(
  data: null,
  synced_at: null,
  sync_error: null
)
```

