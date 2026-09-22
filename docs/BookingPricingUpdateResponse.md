# Repull::BookingPricingUpdateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **property_id** | **String** | Echoed back by &#x60;PUT /v1/channels/booking/availability&#x60;. | [optional] |
| **requested** | **Integer** | How many updates were sent. | [optional] |
| **occupancy** | [**Array&lt;BookingRateWriteOccupancy&gt;**](BookingRateWriteOccupancy.md) |  | [optional] |
| **applied** | **String** | What is known about the nights now. &#x60;verified&#x60; — read back, every night carries what was sent. &#x60;mismatch&#x60; — read back, some do not (&#x60;verification.rows&#x60; / &#x60;restrictions.verification.rows&#x60; name them). &#x60;rejected&#x60; — Booking.com refused everything that was sent. &#x60;partial&#x60; — one half landed and the other did not; read &#x60;price.applied&#x60; and &#x60;restrictions.applied&#x60; to see which, and &#x60;restrictions.rejection.message&#x60; for Booking.com&#39;s reason. &#x60;unverified&#x60; — Booking.com acknowledged the request and no read-back ran: an unknown, not a success. A bare acknowledgement is never reported as \&quot;all applied\&quot;. | [optional] |
| **price** | [**BookingRateWritePriceHalf**](BookingRateWritePriceHalf.md) |  | [optional] |
| **restrictions** | [**BookingRateWriteRestrictionHalf**](BookingRateWriteRestrictionHalf.md) |  | [optional] |
| **verification** | [**BookingRateWriteVerification**](BookingRateWriteVerification.md) |  | [optional] |
| **booking** | **Hash&lt;String, Object&gt;** | Booking.com&#39;s own answers, verbatim: &#x60;rates&#x60; (the rate-amount notification) and &#x60;restrictions&#x60; (the availability notification, when the updates carried any restriction). | [optional] |
| **errors** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | Failures Booking.com named, across both wires. Empty means Booking.com named none — not that the nights changed; that is what &#x60;applied&#x60; is for. | [optional] |
| **rate_plan_read_error** | **String** | Present when Booking.com&#39;s rate-plan read did not complete, so an occupancy fell back to the room definition. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPricingUpdateResponse.new(
  hotel_id: null,
  listing_id: null,
  property_id: null,
  requested: null,
  occupancy: null,
  applied: null,
  price: null,
  restrictions: null,
  verification: null,
  booking: null,
  errors: null,
  rate_plan_read_error: null
)
```

