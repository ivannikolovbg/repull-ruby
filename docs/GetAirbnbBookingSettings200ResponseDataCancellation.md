# Repull::GetAirbnbBookingSettings200ResponseDataCancellation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **short_stay_policy** | **String** | Policy for stays under 28 nights. | [optional] |
| **long_stay_policy** | **String** | Airbnb&#39;s long-term-stay policy id, for stays of 28+ nights. Opaque. | [optional] |
| **non_refundable** | [**GetAirbnbBookingSettings200ResponseDataCancellationNonRefundable**](GetAirbnbBookingSettings200ResponseDataCancellationNonRefundable.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbBookingSettings200ResponseDataCancellation.new(
  short_stay_policy: null,
  long_stay_policy: null,
  non_refundable: null
)
```

