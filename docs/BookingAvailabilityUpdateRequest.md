# Repull::BookingAvailabilityUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | &#x60;rates&#x60; → nightly prices (+ any restrictions sent with them), written at an explicit &#x60;occupancy&#x60;; &#x60;availability&#x60; → inventory, stop-sell and restrictions; &#x60;derived-pricing&#x60; → occupancy-derived pricing rules. A rates update may not carry &#x60;roomsToSell&#x60;: inventory is an &#x60;availability&#x60; write. |  |
| **verify** | **Boolean** | Only for &#x60;type: \&quot;rates\&quot;&#x60;. Default &#x60;true&#x60;: after the write the affected nights are read back off Booking.com so &#x60;applied&#x60; can say &#x60;verified&#x60; or &#x60;mismatch&#x60;. Send &#x60;false&#x60; to skip the read (one fewer Booking.com call); the response then reports &#x60;applied: \&quot;unverified\&quot;&#x60;. | [optional] |
| **property_id** | [**BookingAvailabilityUpdateRequestPropertyId**](BookingAvailabilityUpdateRequestPropertyId.md) |  |  |
| **updates** | [**Array&lt;BookingAvailabilityUpdateRequestUpdatesInner&gt;**](BookingAvailabilityUpdateRequestUpdatesInner.md) | For &#x60;type: \&quot;rates\&quot;&#x60; each item is a &#x60;BookingPricingRateUpdate&#x60;; for &#x60;type: \&quot;availability\&quot;&#x60; a &#x60;BookingAvailabilityUpdate&#x60;; for &#x60;type: \&quot;derived-pricing\&quot;&#x60; a derived-price rule set. |  |

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

