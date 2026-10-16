# Repull::PromotionRefreshResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;Promotion&gt;**](Promotion.md) |  | [optional] |
| **synced_at** | **Time** |  | [optional] |
| **errors** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionRefreshResponse.new(
  data: null,
  synced_at: null,
  errors: null
)
```

