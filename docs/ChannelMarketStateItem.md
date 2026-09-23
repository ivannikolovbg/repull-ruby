# Repull::ChannelMarketStateItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  |  |
| **state** | **String** | **What is now true of this item**, not what you asked for.  &#x60;offline&#x60; — it is off the market. &#x60;online&#x60; — it is back on. &#x60;unchanged&#x60; — nothing was sent, or what was sent did not take; &#x60;code&#x60; and &#x60;message&#x60; say why.  &#x60;unchanged&#x60; never means \&quot;it was already like that\&quot;: it means we did not put it there, and it is still in whatever state it was in before the call. |  |
| **ok** | **Boolean** | True only when the channel confirmed the change. |  |
| **connection_id** | **String** | Airbnb connection row id — the &#x60;id&#x60; from &#x60;GET /v1/channels/airbnb/listings/{id}&#x60;. Present on Airbnb items. | [optional] |
| **hotel_id** | **String** | The Booking.com property acted on. Present on Booking.com items; null when the property could not be resolved. | [optional] |
| **code** | **String** | Error code when &#x60;ok&#x60; is false — the SAME code the channel-specific endpoint returns for this failure, so one vocabulary covers both surfaces. Absent when &#x60;ok&#x60; is true.  The channel codes come in pairs, and the pair is the retryable split — the most useful bit in the whole item:  - &#x60;airbnb_rejected&#x60; / &#x60;booking_rejected&#x60; — the channel refused the request AS SENT. &#x60;message&#x60; carries its own reason. Correct it and send again; resending the same thing is refused again. - &#x60;airbnb_error&#x60; / &#x60;booking_error&#x60; — the channel did not complete the request (outage, timeout, server error). Nothing about the request needs to change: retry with backoff.  Plus &#x60;ambiguous_booking_mapping&#x60; (name the property with &#x60;hotelId&#x60;) and &#x60;payment_required&#x60; (a billing refusal, which keeps its own code rather than being buried under a channel one). | [optional] |
| **previous_code** | **String** | The &#x60;code&#x60; this item used to carry, for callers still branching on the old string. A migration aid with a deprecation window — **&#x60;code&#x60; is canonical.**  This fan-out reaches Airbnb through an internal hop that flattens a refusal into its own 500, so an unambiguous Airbnb 400 (\&quot;Please specify a valid room type\&quot;) was reported as &#x60;airbnb_error&#x60; — whose published advice is to retry with backoff, forever, for something Airbnb will never accept. It now reads Airbnb&#39;s real status and answers &#x60;airbnb_rejected&#x60;, and the classification covers the whole 4xx range rather than only &#x60;400&#x60;. Items whose code changed carry &#x60;previousCode&#x60;. **Removed in v2.** | [optional] |
| **message** | **String** | The channel&#39;s own reason, verbatim. Absent when &#x60;ok&#x60; is true. | [optional] |
| **fix** | **String** | What to do about it, phrased for the direction you asked for — \&quot;still live and taking bookings\&quot; and \&quot;still down\&quot; call for different reactions. Absent when &#x60;ok&#x60; is true. | [optional] |
| **verified** | **Boolean** | Airbnb only, and only when going offline: the listing was READ BACK after the deactivation and confirmed down. Airbnb accepts a deactivation and leaves some listings live, so \&quot;we sent the request\&quot; is a weaker claim than this one and is never reported as success. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ChannelMarketStateItem.new(
  channel: null,
  state: null,
  ok: null,
  connection_id: null,
  hotel_id: null,
  code: null,
  previous_code: airbnb_error,
  message: null,
  fix: null,
  verified: null
)
```

