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
| **occupancy_pricing** | [**Array&lt;BookingOccupancyRule&gt;**](BookingOccupancyRule.md) | The occupancy rules this rate plan holds on Booking.com — what &#x60;PUT /v1/channels/booking/availability&#x60; with &#x60;type: \&quot;derived-pricing\&quot;&#x60; writes, in the same terms (&#x60;percentage: -10&#x60; is 10% less). Empty when the rate plan has none; &#x60;null&#x60; when &#x60;source&#x60; is &#x60;mirror&#x60;. The price for a party of &#x60;persons&#x60; is the nightly price plus &#x60;additional&#x60; (or changed by &#x60;percentage&#x60;), on every night. | [optional] |

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
  is_child_rate: null,
  occupancy_pricing: null
)
```

