# Repull::AccountUnitsAddedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** | The workspace the login is connected in. |  |
| **provider** | **String** | The channel. Today only Booking.com Extranet logins send this event. |  |
| **account_id** | **String** | The Booking.com account id behind the Extranet login — the same value as &#x60;account.externalAccountId&#x60;. |  |
| **connection_id** | **String** | Our connection record id: the &#x60;X-Account-Id&#x60; value, the same as &#x60;account.id&#x60;. |  |
| **handle** | **String** | The connection handle the units and mappings endpoints take: &#x60;booking_extranet:{accountId}&#x60;. |  |
| **hotels** | [**Array&lt;AccountUnitsAddedPayloadHotelsInner&gt;**](AccountUnitsAddedPayloadHotelsInner.md) | The property the new units belong to. |  |
| **units** | [**Array&lt;AccountUnitsAddedPayloadUnitsInner&gt;**](AccountUnitsAddedPayloadUnitsInner.md) | The new units, as &#x60;GET /v1/connections/{id}/units&#x60; lists them. |  |
| **added_at** | **Time** | When the sync found the new units. |  |
| **next_steps** | [**Array&lt;AccountUnitsAddedPayloadNextStepsInner&gt;**](AccountUnitsAddedPayloadNextStepsInner.md) | What to call next: list the units, then map them. |  |

## Example

```ruby
require 'repull'

instance = Repull::AccountUnitsAddedPayload.new(
  workspace_id: null,
  provider: null,
  account_id: 20123456,
  connection_id: 482,
  handle: booking_extranet:20123456,
  hotels: null,
  units: null,
  added_at: null,
  next_steps: null
)
```

