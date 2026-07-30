# Repull::BookingAvailabilityUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | &#x60;rates&#x60; → price + restrictions (&#x60;updateRates&#x60;); &#x60;availability&#x60; → inventory + stop-sell + restrictions (&#x60;updateAvailability&#x60;); &#x60;derived-pricing&#x60; → occupancy-derived pricing rules (&#x60;updateDerivedPricing&#x60;). |  |
| **property_id** | [**BookingAvailabilityUpdateRequestPropertyId**](BookingAvailabilityUpdateRequestPropertyId.md) |  |  |
| **updates** | [**Array&lt;BookingAvailabilityUpdateRequestUpdatesInner&gt;**](BookingAvailabilityUpdateRequestUpdatesInner.md) | For &#x60;type: \&quot;rates\&quot;&#x60; each item is a &#x60;BookingPricingRateUpdate&#x60;; for &#x60;type: \&quot;availability\&quot;&#x60; a &#x60;BookingAvailabilityUpdate&#x60;; for &#x60;type: \&quot;derived-pricing\&quot;&#x60; a derived-price rule set. |  |

## Example

```ruby
require 'repull'

instance = Repull::BookingAvailabilityUpdateRequest.new(
  type: null,
  property_id: null,
  updates: null
)
```

