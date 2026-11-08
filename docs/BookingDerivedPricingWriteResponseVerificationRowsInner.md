# Repull::BookingDerivedPricingWriteResponseVerificationRowsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** |  | [optional] |
| **rate_id** | **String** |  | [optional] |
| **expected** | [**Array&lt;BookingOccupancyRule&gt;**](BookingOccupancyRule.md) |  | [optional] |
| **booking** | [**Array&lt;BookingOccupancyRule&gt;**](BookingOccupancyRule.md) |  | [optional] |
| **match** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingDerivedPricingWriteResponseVerificationRowsInner.new(
  room_id: null,
  rate_id: null,
  expected: null,
  booking: null,
  match: null
)
```

