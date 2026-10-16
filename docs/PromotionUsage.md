# Repull::PromotionUsage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bookings** | **Integer** |  | [optional] |
| **room_nights** | **Integer** |  | [optional] |
| **cancellations** | **Integer** |  | [optional] |
| **revenue** | [**PromotionUsageRevenue**](PromotionUsageRevenue.md) |  | [optional] |
| **last_applied_at** | **Time** | Airbnb Custom promotion: when it was last applied to a booking. | [optional] |
| **last_applied_amount** | [**PromotionUsageRevenue**](PromotionUsageRevenue.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionUsage.new(
  bookings: null,
  room_nights: null,
  cancellations: null,
  revenue: null,
  last_applied_at: null,
  last_applied_amount: null
)
```

