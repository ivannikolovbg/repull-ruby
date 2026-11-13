# Repull::ConnectSessionAbandonedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** |  | [optional] |
| **state** | **String** | The &#x60;state&#x60; you passed when creating the session. | [optional] |
| **provider** | **String** | Channel or PMS the user picked: airbnb, booking, booking_extranet, vrbo, hostaway, … | [optional] |
| **status** | **String** | &#x60;expired&#x60;: the link ran out before the user finished. &#x60;awaiting_room_mapping&#x60;: the account is connected; its rooms were never matched to listings. | [optional] |
| **reason** | **String** | &#x60;not_finished&#x60;: opened and left. &#x60;credentials_rejected&#x60;: the provider refused the key or token the user entered. &#x60;provider_approval_pending&#x60;: Booking.com never confirmed the property in the Extranet. &#x60;mapping_not_finished&#x60;: connected, rooms not mapped. &#x60;failed&#x60;: another error, see &#x60;lastErrorCode&#x60;. | [optional] |
| **last_error_code** | **String** | The last error the user hit on the Connect page, e.g. &#x60;invalid_credentials&#x60;, &#x60;awaiting_designation&#x60;. | [optional] |
| **external_account_id** | **String** | Booking.com: the Hotel ID the user entered while waiting for the Extranet approval. Booking.com Extranet in &#x60;awaiting_room_mapping&#x60;: the Booking.com account id of the connected login. | [optional] |
| **connection_id** | **String** | Booking.com Extranet in &#x60;awaiting_room_mapping&#x60;: the connection record of the connected login (the &#x60;X-Account-Id&#x60;). Absent otherwise. | [optional] |
| **fix_url** | **String** | Booking.com Extranet in &#x60;awaiting_room_mapping&#x60;: a durable link that reopens Connect on the room-mapping step for this login. Send the host there to finish. &#x60;null&#x60; when there is nothing to resume. | [optional] |
| **next_step** | **String** | What to tell the user, in plain English. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **last_activity_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectSessionAbandonedPayload.new(
  session_id: cs_abc123,
  state: user_8421,
  provider: booking,
  status: null,
  reason: null,
  last_error_code: awaiting_designation,
  external_account_id: 17168363,
  connection_id: 1701,
  fix_url: null,
  next_step: null,
  created_at: null,
  last_activity_at: null
)
```

