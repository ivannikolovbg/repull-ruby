# Repull::ConnectSessionCompletedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** |  | [optional] |
| **state** | **String** | The &#x60;state&#x60; you passed when creating the session. | [optional] |
| **provider** | **String** | Channel or PMS: airbnb, booking, booking_extranet, vrbo, plumguide, hostaway, … | [optional] |
| **external_account_id** | **String** | The provider&#39;s own account id — Airbnb host id, Booking.com hotel id, Vrbo account id, or the PMS account. | [optional] |
| **connection_id** | **Integer** | Repull connection id, when the account has one (the &#x60;X-Account-Id&#x60; value). | [optional] |
| **purpose** | **String** |  | [optional] |
| **completed_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectSessionCompletedPayload.new(
  session_id: cs_abc123,
  state: user_8421,
  provider: vrbo,
  external_account_id: 36,
  connection_id: null,
  purpose: null,
  completed_at: null
)
```

