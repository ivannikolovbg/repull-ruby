# Repull::BookingDerivedPricingWriteResponseRatesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** |  | [optional] |
| **rate_id** | **String** |  | [optional] |
| **leading_occupancy** | **Integer** |  | [optional] |
| **occupancies** | [**Array&lt;BookingOccupancyRule&gt;**](BookingOccupancyRule.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingDerivedPricingWriteResponseRatesInner.new(
  room_id: null,
  rate_id: null,
  leading_occupancy: null,
  occupancies: null
)
```

