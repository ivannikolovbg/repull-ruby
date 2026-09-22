# Repull::BookingRateWritePriceHalf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **requested** | **Integer** | How many updates carried a price. | [optional] |
| **applied** | **String** | What is known about the amounts. Same vocabulary as the top-level &#x60;applied&#x60;, for this half alone. | [optional] |
| **verification** | [**BookingRateWriteVerification**](BookingRateWriteVerification.md) |  | [optional] |
| **errors** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **rejection** | [**BookingUpstreamFailure**](BookingUpstreamFailure.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRateWritePriceHalf.new(
  requested: null,
  applied: null,
  verification: null,
  errors: null,
  rejection: null
)
```

