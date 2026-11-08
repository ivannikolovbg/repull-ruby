# Repull::BookingAvailabilityUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | &#x60;rates&#x60; → nightly prices (+ any restrictions sent with them), written at an explicit &#x60;occupancy&#x60;; &#x60;availability&#x60; → inventory, stop-sell and restrictions; &#x60;derived-pricing&#x60; → occupancy-derived pricing rules. A rates update may not carry &#x60;roomsToSell&#x60;: inventory is an &#x60;availability&#x60; write. |  |
| **verify** | **Boolean** | Default &#x60;true&#x60;, for every &#x60;type&#x60;: after the write Repull reads the result back off Booking.com so &#x60;applied&#x60; says &#x60;verified&#x60; or &#x60;mismatch&#x60; — prices and restrictions per night (&#x60;rates&#x60;, &#x60;availability&#x60;), the rule set per rate plan (&#x60;derived-pricing&#x60;). Send &#x60;false&#x60; to skip the read; &#x60;applied&#x60; is then &#x60;unverified&#x60; (&#x60;acknowledged&#x60; for a restriction-only &#x60;availability&#x60; write). | [optional] |
| **property_id** | [**BookingAvailabilityUpdateRequestPropertyId**](BookingAvailabilityUpdateRequestPropertyId.md) |  |  |
| **updates** | [**Array&lt;BookingAvailabilityUpdateRequestUpdatesInner&gt;**](BookingAvailabilityUpdateRequestUpdatesInner.md) | For &#x60;type: \&quot;rates\&quot;&#x60; each item is a &#x60;BookingPricingRateUpdate&#x60;; for &#x60;type: \&quot;availability\&quot;&#x60; a &#x60;BookingAvailabilityUpdate&#x60;; for &#x60;type: \&quot;derived-pricing\&quot;&#x60; a &#x60;BookingDerivedPricingUpdate&#x60;. |  |

## Example

```ruby
require 'repull'

instance = Repull::BookingAvailabilityUpdateRequest.new(
  type: null,
  verify: null,
  property_id: null,
  updates: null
)
```

