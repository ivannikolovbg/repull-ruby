# Repull::PromotionCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  |  |
| **type** | [**PromotionType**](PromotionType.md) |  |  |
| **name** | **String** | Booking.com only; only you see it. | [optional] |
| **discount_percent** | **Integer** | Booking.com only — Airbnb sets its own rates. Limits per type are in the catalog. | [optional] |
| **rules** | [**PromotionRules**](PromotionRules.md) |  | [optional] |
| **hotel_id** | **String** | Booking.com: required when the listing has a room on more than one property (see &#x60;properties&#x60; in the catalog). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionCreateRequest.new(
  channel: null,
  type: null,
  name: null,
  discount_percent: null,
  rules: null,
  hotel_id: null
)
```

