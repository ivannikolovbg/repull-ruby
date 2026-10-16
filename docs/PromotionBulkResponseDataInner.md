# Repull::PromotionBulkResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **ok** | **Boolean** |  | [optional] |
| **promotion** | [**Promotion**](Promotion.md) |  | [optional] |
| **error** | [**PromotionBulkResponseDataInnerError**](PromotionBulkResponseDataInnerError.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionBulkResponseDataInner.new(
  listing_id: null,
  ok: null,
  promotion: null,
  error: null
)
```

