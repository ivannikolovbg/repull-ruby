# Repull::GetAirbnbListingCancellation200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **short_stay_policy** | **String** | Policy for stays under 28 nights. | [optional] |
| **long_stay_policy** | **String** | Airbnb&#39;s long-term-stay policy id (28+ nights). | [optional] |
| **non_refundable** | [**GetAirbnbListingCancellation200ResponseDataNonRefundable**](GetAirbnbListingCancellation200ResponseDataNonRefundable.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbListingCancellation200ResponseData.new(
  short_stay_policy: null,
  long_stay_policy: null,
  non_refundable: null
)
```

