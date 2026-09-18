# Repull::UpdateAirbnbBookingSettingsRequestCancellation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **short_stay_policy** | **String** |  | [optional] |
| **long_stay_policy** | **String** |  | [optional] |
| **non_refundable** | [**UpdateAirbnbBookingSettingsRequestCancellationNonRefundable**](UpdateAirbnbBookingSettingsRequestCancellationNonRefundable.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbBookingSettingsRequestCancellation.new(
  short_stay_policy: null,
  long_stay_policy: null,
  non_refundable: null
)
```

