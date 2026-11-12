# Repull::ConnectSessionCompletedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** |  | [optional] |
| **state** | **String** | The &#x60;state&#x60; you passed when creating the session. | [optional] |
| **provider** | **String** | Channel or PMS: airbnb, booking, booking_extranet, vrbo, hostaway, … | [optional] |
| **external_account_id** | **String** | The platform&#39;s own account id: Airbnb host id; Booking.com hotel id (&#x60;booking&#x60;); the Booking.com account id behind the Extranet login (&#x60;booking_extranet&#x60;); Vrbo&#39;s account id (&#x60;vrbo&#x60;); the PMS&#39;s own account or company id. &#x60;null&#x60; when the platform id is not known yet (a Vrbo sign-in before its account id is captured, a PMS that does not expose one); never a Repull id. | [optional] |
| **connection_id** | **Integer** | Our connection record id: the &#x60;X-Account-Id&#x60; value, the same as &#x60;account.id&#x60;. &#x60;null&#x60; only when the account has no connection record (e.g. a Vrbo sign-in in a workspace with no Vrbo connection). | [optional] |
| **purpose** | **String** |  | [optional] |
| **completed_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectSessionCompletedPayload.new(
  session_id: cs_abc123,
  state: user_8421,
  provider: booking_extranet,
  external_account_id: 20123456,
  connection_id: 482,
  purpose: null,
  completed_at: null
)
```

