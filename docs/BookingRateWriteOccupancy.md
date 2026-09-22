# Repull::BookingRateWriteOccupancy

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **index** | **Integer** | Position of the update in the request &#x60;updates[]&#x60;. | [optional] |
| **room_id** | **String** |  | [optional] |
| **rate_id** | **String** |  | [optional] |
| **value** | **Integer** | The party size the amount was written against. | [optional] |
| **source** | **String** | &#x60;request&#x60; — you stated it. &#x60;rate_plan&#x60; — Booking.com&#39;s maximum occupancy for this rate plan. &#x60;room&#x60; — Booking.com&#39;s room definition, used when the rate plan did not state one. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRateWriteOccupancy.new(
  index: null,
  room_id: null,
  rate_id: null,
  value: null,
  source: null
)
```

