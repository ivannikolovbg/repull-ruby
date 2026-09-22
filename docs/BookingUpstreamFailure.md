# Repull::BookingUpstreamFailure

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | Booking.com&#39;s own reason, taken from the body they answered with — never a paraphrase of their status code. | [optional] |
| **upstream_status** | **Integer** | The HTTP status Booking.com answered with. | [optional] |
| **booking_code** | **String** | Booking.com&#39;s own error code, when their envelope named one. | [optional] |
| **booking_ruid** | **String** | Booking.com&#39;s request id. Quote it to their connectivity support to have them trace the call. | [optional] |
| **body** | **String** | The upstream body, trimmed and capped, for when the parsed reason is not enough. | [optional] |
| **code** | **String** | How the failure was classified internally (e.g. &#x60;BAD_REQUEST&#x60;, &#x60;RATE_LIMITED&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingUpstreamFailure.new(
  message: null,
  upstream_status: null,
  booking_code: null,
  booking_ruid: null,
  body: null,
  code: null
)
```

