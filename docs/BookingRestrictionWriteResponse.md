# Repull::BookingRestrictionWriteResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **requested** | **Integer** | How many updates carried a restriction. | [optional] |
| **applied** | **String** | &#x60;verified&#x60; — read back, Booking.com holds every restriction sent. &#x60;mismatch&#x60; — read back, some differ (&#x60;verification.rows&#x60;). &#x60;rejected&#x60; — Booking.com refused it (&#x60;rejection&#x60;). &#x60;unverified&#x60; — the read-back could not run. &#x60;acknowledged&#x60; — you sent &#x60;verify: false&#x60;: Booking.com took the request and nothing was read back. | [optional] |
| **fields** | **Array&lt;String&gt;** |  | [optional] |
| **dates** | [**Array&lt;BookingRestrictionRequestRow&gt;**](BookingRestrictionRequestRow.md) |  | [optional] |
| **verification** | [**BookingRestrictionVerification**](BookingRestrictionVerification.md) |  | [optional] |
| **errors** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **booking** | **Hash&lt;String, Object&gt;** | Booking.com&#39;s answer, verbatim. | [optional] |
| **rejection** | [**BookingUpstreamFailure**](BookingUpstreamFailure.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRestrictionWriteResponse.new(
  requested: null,
  applied: null,
  fields: null,
  dates: null,
  verification: null,
  errors: null,
  booking: null,
  rejection: null
)
```

