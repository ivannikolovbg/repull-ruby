# Repull::ReservationCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** | Internal Repull property id — see &#x60;GET /v1/properties&#x60;. |  |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** | Must be after &#x60;checkIn&#x60;. |  |
| **guest** | [**ReservationGuestInput**](ReservationGuestInput.md) |  |  |
| **platform** | **String** | OTA platforms are deliberately absent — those reservations are owned by the channel and arrive through sync. | [optional][default to &#39;direct&#39;] |
| **status** | **String** | Lifecycle status to open the reservation in. Defaults to confirmed. | [optional][default to &#39;accept&#39;] |
| **check_in_time** | **String** |  | [optional] |
| **check_out_time** | **String** |  | [optional] |
| **guest_id** | **Integer** | Attach an existing guest instead of matching/creating one. Must belong to this workspace. | [optional] |
| **guest_count** | **Integer** |  | [optional] |
| **currency** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCreateRequest.new(
  listing_id: 4118,
  check_in: Thu Oct 01 00:00:00 UTC 2026,
  check_out: Mon Oct 05 00:00:00 UTC 2026,
  guest: null,
  platform: null,
  status: null,
  check_in_time: 16:00,
  check_out_time: 10:00,
  guest_id: 91234,
  guest_count: 2,
  currency: USD
)
```

