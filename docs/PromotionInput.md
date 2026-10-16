# Repull::PromotionInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  |  |
| **type** | [**PromotionType**](PromotionType.md) |  |  |
| **name** | **String** | Booking.com only; only you see it. | [optional] |
| **discount_percent** | **Integer** | Booking.com only — Airbnb sets its own rates. Limits per type are in the catalog. | [optional] |
| **rules** | [**PromotionRules**](PromotionRules.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionInput.new(
  channel: null,
  type: null,
  name: null,
  discount_percent: null,
  rules: null
)
```

