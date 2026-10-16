# Repull::PromotionUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **discount_percent** | **Integer** |  | [optional] |
| **rules** | [**PromotionRules**](PromotionRules.md) |  | [optional] |
| **confirm_shared** | **Boolean** | Required when the promotion also covers other listings’ rooms — the change applies to them too. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionUpdateRequest.new(
  name: null,
  discount_percent: null,
  rules: null,
  confirm_shared: null
)
```

