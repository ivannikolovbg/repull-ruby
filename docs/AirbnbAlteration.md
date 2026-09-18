# Repull::AirbnbAlteration

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Internal Repull mirror-row id (not the Airbnb alteration id — use &#x60;alterationId&#x60; for the &#x60;{id}&#x60; path param on the get / accept / decline routes). | [optional] |
| **alteration_id** | **String** | Airbnb alteration id. This is the &#x60;{id}&#x60; you pass to &#x60;GET/POST /v1/channels/airbnb/alterations/{id}&#x60; and the accept / decline sub-routes. | [optional] |
| **reservation_id** | **String** | Repull reservation id the alteration belongs to. | [optional] |
| **account_id** | **String** | Which connected Airbnb account this row belongs to — the Airbnb host id, as a string (they exceed 2^53). The same value &#x60;?account_id&#x3D;&#x60; accepts and &#x60;GET /v1/connect/airbnb&#x60; returns as &#x60;accounts[].externalAccountId&#x60;. | [optional] |
| **account_name** | **String** | Display name of that connected Airbnb account. | [optional] |
| **platform** | **String** | Always &#x60;airbnb&#x60; on this surface. | [optional] |
| **status** | **String** | Alteration lifecycle status — e.g. &#x60;pending&#x60; (awaiting a decision), &#x60;accepted&#x60;, &#x60;declined&#x60;, &#x60;canceled&#x60;. | [optional] |
| **initiator** | **String** | Who proposed the alteration — e.g. &#x60;host&#x60; or &#x60;guest&#x60;. | [optional] |
| **reason** | **String** | Free-text reason supplied with the alteration request. | [optional] |
| **notes** | **String** | Additional notes attached to the alteration. | [optional] |
| **original_check_in** | **Time** | Check-in on the reservation BEFORE the proposed change. | [optional] |
| **original_check_out** | **Time** | Check-out on the reservation BEFORE the proposed change. | [optional] |
| **original_guest_count** | **Integer** | Guest count BEFORE the proposed change. | [optional] |
| **original_total_price** | **String** | Total price (decimal string) BEFORE the proposed change. | [optional] |
| **new_check_in** | **Time** | Proposed new check-in. | [optional] |
| **new_check_out** | **Time** | Proposed new check-out. | [optional] |
| **new_guest_count** | **Integer** | Proposed new guest count. | [optional] |
| **new_total_price** | **String** | Proposed new total price (decimal string). | [optional] |
| **new_listing_id** | **String** | Repull listing id the alteration moves the reservation to — a **listing transfer**. &#x60;null&#x60; when the alteration does not change the listing, which is the usual case. Compare it with the reservation&#39;s current &#x60;listingId&#x60; to render the move. Like every id on this API it is a string. | [optional] |
| **new_airbnb_listing_id** | **String** | The same transfer target as Airbnb spells it (the Airbnb listing id). Present alongside &#x60;newListingId&#x60;; it is also the only one of the two that is set when the destination listing has not been imported into this workspace. | [optional] |
| **created_at** | **Time** | When the alteration was first mirrored locally. | [optional] |
| **updated_at** | **Time** | When the alteration mirror row was last updated. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbAlteration.new(
  id: null,
  alteration_id: null,
  reservation_id: null,
  account_id: 1772489413932732258,
  account_name: Pomello,
  platform: airbnb,
  status: null,
  initiator: null,
  reason: null,
  notes: null,
  original_check_in: null,
  original_check_out: null,
  original_guest_count: null,
  original_total_price: null,
  new_check_in: null,
  new_check_out: null,
  new_guest_count: null,
  new_total_price: null,
  new_listing_id: 4118,
  new_airbnb_listing_id: 18871326,
  created_at: null,
  updated_at: null
)
```

