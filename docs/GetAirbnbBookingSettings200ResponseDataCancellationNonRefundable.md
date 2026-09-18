# Repull::GetAirbnbBookingSettings200ResponseDataCancellationNonRefundable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enabled** | **Boolean** |  | [optional] |
| **discount_percent** | **Integer** | Whole-percent discount a guest gets for giving up refundability. | [optional] |
| **price_factor** | **Float** | Airbnb&#39;s own representation: &#x60;1 - discountPercent/100&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbBookingSettings200ResponseDataCancellationNonRefundable.new(
  enabled: null,
  discount_percent: null,
  price_factor: null
)
```

