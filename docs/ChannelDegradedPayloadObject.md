# Repull::ChannelDegradedPayloadObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **customer_id** | **Integer** |  |  |
| **provider** | **String** |  |  |
| **external_account_id** | **String** | The platform&#39;s own account id: Airbnb host id; Booking.com hotel id (&#x60;booking&#x60;); the Booking.com account id behind the Extranet login (&#x60;booking_extranet&#x60;); Vrbo&#39;s account id (&#x60;vrbo&#x60;); the PMS&#39;s own account or company id. &#x60;null&#x60; when the platform id is not known yet (a Vrbo sign-in before its account id is captured, a PMS that does not expose one); never a Repull id. | [optional] |
| **status** | **String** |  |  |
| **detail** | **String** | What we observed, in the provider&#39;s words where possible. A bare \&quot;degraded\&quot; tells nobody what to fix. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ChannelDegradedPayloadObject.new(
  customer_id: null,
  provider: booking,
  external_account_id: null,
  status: null,
  detail: null
)
```

