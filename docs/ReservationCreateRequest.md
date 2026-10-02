# Repull::ReservationCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** | Internal Repull property id — see &#x60;GET /v1/properties&#x60;. |  |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** | Must be after &#x60;checkIn&#x60;. |  |
| **guest** | [**ReservationGuestInput**](ReservationGuestInput.md) |  |  |
| **platform** | **String** | OTA platforms are deliberately absent — those reservations are owned by the channel and arrive through sync. &#x60;owner&#x60; is refused on a PMS listing (block owner stays in the PMS). | [optional][default to &#39;direct&#39;] |
| **status** | **String** | &#x60;confirmed&#x60; (default) or &#x60;tentative&#x60; (an optional hold, where the PMS has one). On a listing not managed in a PMS the value is passed to the reservation pipeline as before. | [optional][default to &#39;confirmed&#39;] |
| **adults** | **Integer** |  | [optional] |
| **children** | **Integer** |  | [optional] |
| **guest_count** | **Integer** | Total guests. On a PMS listing without &#x60;adults&#x60;, used as the adult count. | [optional] |
| **total_price** | **Float** | PMS listings only: the total for the whole stay, in the listing&#39;s currency. Honoured where &#x60;capabilities.reservations.customPrice&#x60; is true; omit it and the PMS prices the stay (from its quote where it has one). Refused on a listing not managed in a PMS, whose rate engine prices the stay. | [optional] |
| **notes** | **String** | PMS listings only: booking notes stored in the PMS. | [optional] |
| **unit_id** | **String** | PMS listings only: book this unit (&#x60;GET /v1/listings/{id}&#x60; → &#x60;units[].id&#x60;). Refused by PMSs that cannot target a unit. | [optional] |
| **send_confirmation_email** | **Boolean** | PMS listings only: ask the PMS to email the guest its own confirmation, where the PMS supports it. | [optional] |
| **check_in_time** | **String** | Listings not managed in a PMS only. | [optional] |
| **check_out_time** | **String** | Listings not managed in a PMS only. | [optional] |
| **guest_id** | **Integer** | Listings not managed in a PMS only: attach an existing guest instead of matching/creating one. Must belong to this workspace. | [optional] |
| **currency** | **String** | Listings not managed in a PMS only (a PMS books in the property&#39;s currency). | [optional] |

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
  adults: 2,
  children: 1,
  guest_count: 3,
  total_price: 880,
  notes: Late arrival, around 22:00.,
  unit_id: 3f1c9a20,
  send_confirmation_email: false,
  check_in_time: 16:00,
  check_out_time: 10:00,
  guest_id: 91234,
  currency: USD
)
```

