# Repull::BookingDerivedPricingWriteResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** |  | [optional] |
| **requested** | **Integer** |  | [optional] |
| **applied** | **String** | &#x60;verified&#x60; — read back, each rate plan holds exactly the rules sent. &#x60;mismatch&#x60; — read back and they differ (&#x60;verification.rows&#x60;). &#x60;unverified&#x60; — &#x60;verify: false&#x60;, or the read failed. A refusal is &#x60;422 booking_rejected&#x60;, not a 200. | [optional] |
| **rates** | [**Array&lt;BookingDerivedPricingWriteResponseRatesInner&gt;**](BookingDerivedPricingWriteResponseRatesInner.md) | Per rate plan, the rules it holds now (as read back; as sent when unverified). | [optional] |
| **verification** | [**BookingDerivedPricingWriteResponseVerification**](BookingDerivedPricingWriteResponseVerification.md) |  | [optional] |
| **booking** | **Hash&lt;String, Object&gt;** | Booking.com&#39;s answer, verbatim. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingDerivedPricingWriteResponse.new(
  property_id: null,
  requested: null,
  applied: null,
  rates: null,
  verification: null,
  booking: null
)
```

