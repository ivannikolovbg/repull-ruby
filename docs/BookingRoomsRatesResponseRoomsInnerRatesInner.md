# Repull::BookingRoomsRatesResponseRoomsInnerRatesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rate_id** | **String** | Booking.com rate-plan id — use as &#x60;rateId&#x60; in an ARI update. | [optional] |
| **rate_name** | **String** |  | [optional] |
| **policy** | **String** | Cancellation policy name. | [optional] |
| **policy_id** | **String** |  | [optional] |
| **max_persons** | **Integer** | The party size this rate plan prices. A rate amount must be written at this number: above it Booking.com declines the price in silence, below it answers 400. Null when &#x60;source&#x60; is &#x60;mirror&#x60;. | [optional] |
| **pricing_type** | **String** | Pricing model: &#x60;Standard&#x60;, &#x60;RLO&#x60;, &#x60;OBP&#x60;, or &#x60;LOS&#x60;. | [optional] |
| **is_child_rate** | **Boolean** | Whether this rate plan is a derived child rate. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRoomsRatesResponseRoomsInnerRatesInner.new(
  rate_id: null,
  rate_name: null,
  policy: null,
  policy_id: null,
  max_persons: null,
  pricing_type: null,
  is_child_rate: null
)
```

