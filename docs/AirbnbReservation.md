# Repull::AirbnbReservation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | This Airbnb record&#39;s id in Repull. |  |
| **confirmation_code** | **String** | Airbnb confirmation code. |  |
| **reservation_id** | **String** | The same stay on the unified reservations API: &#x60;GET /v1/reservations/{id}&#x60;. Null only while that record is still being created. |  |
| **listing_id** | **String** | The Repull listing id (&#x60;GET /v1/listings/{id}&#x60;). |  |
| **airbnb_listing_id** | **String** | Airbnb&#39;s own listing id — the value &#x60;?listing_id&#x3D;&#x60; takes. |  |
| **account_id** | **String** | Which connected Airbnb account this row belongs to — the Airbnb host id, as a string (they exceed 2^53). The same value &#x60;?account_id&#x3D;&#x60; accepts and &#x60;GET /v1/connect/airbnb&#x60; returns as &#x60;accounts[].externalAccountId&#x60;. |  |
| **account_name** | **String** | Display name of that connected Airbnb account. |  |
| **status** | **String** | Normalised status. Airbnb&#39;s own value is in &#x60;airbnbStatus&#x60;. |  |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** |  |  |
| **guest_name** | **String** |  |  |
| **guest_count** | **Integer** |  |  |
| **total_price** | **Float** | What the guest paid, in &#x60;currency&#x60;. |  |
| **currency** | **String** |  |  |
| **payout** | **Float** | What the host is expected to receive, in &#x60;payoutCurrency&#x60;. |  |
| **payout_currency** | **String** |  |  |
| **listing_airbnb_id** | **String** | Internal link id of the Airbnb listing. Use &#x60;airbnbListingId&#x60; or &#x60;listingId&#x60; instead. | [optional] |
| **airbnb_reservation_id** | **String** | Same as &#x60;confirmationCode&#x60;. | [optional] |
| **host_id** | **String** | Same as &#x60;accountId&#x60;. | [optional] |
| **guest_airbnb_id** | **String** | The guest&#39;s Airbnb user id. | [optional] |
| **guest_first_name** | **String** |  | [optional] |
| **guest_last_name** | **String** |  | [optional] |
| **guest_profile_picture** | **String** |  | [optional] |
| **airbnb_status** | **String** | Airbnb&#39;s raw status: &#x60;accept&#x60;, &#x60;pending&#x60;, &#x60;cancelled_by_guest&#x60;, &#x60;cancelled_by_host&#x60;, &#x60;cancelled_by_admin&#x60;, &#x60;deny&#x60;, &#x60;failed_verification&#x60;, &#x60;pending_voided&#x60;, &#x60;checkpoint_voided&#x60;, &#x60;timeout&#x60;, … | [optional] |
| **cancellation_policy** | **String** |  | [optional] |
| **cancellation_reason** | **String** |  | [optional] |
| **total_paid_amount** | **String** | &#x60;totalPrice&#x60; as a decimal string. | [optional] |
| **total_paid_currency** | **String** |  | [optional] |
| **expected_payout_amount** | **String** | &#x60;payout&#x60; as a decimal string. | [optional] |
| **expected_payout_currency** | **String** |  | [optional] |
| **canceled_at** | **Time** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **check_in_datetime** | **Time** | Check-in date at 00:00 UTC. Prefer &#x60;checkIn&#x60;. | [optional] |
| **check_out_datetime** | **Time** | Check-out date at 00:00 UTC. Prefer &#x60;checkOut&#x60;. | [optional] |
| **time_zone** | **String** |  | [optional] |
| **customer_id** | **String** | Your workspace id. | [optional] |
| **guest_id** | **String** | The guest on &#x60;GET /v1/guests/{id}&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbReservation.new(
  id: 307200,
  confirmation_code: HMABC12345,
  reservation_id: 667929,
  listing_id: 42343,
  airbnb_listing_id: 53866721,
  account_id: 1772489413932732258,
  account_name: Seaside Stays,
  status: accepted,
  check_in: Sat Dec 05 00:00:00 UTC 2026,
  check_out: Tue Dec 08 00:00:00 UTC 2026,
  guest_name: null,
  guest_count: null,
  total_price: 233.51,
  currency: USD,
  payout: 190.32,
  payout_currency: USD,
  listing_airbnb_id: null,
  airbnb_reservation_id: null,
  host_id: null,
  guest_airbnb_id: null,
  guest_first_name: null,
  guest_last_name: null,
  guest_profile_picture: null,
  airbnb_status: accept,
  cancellation_policy: moderate,
  cancellation_reason: null,
  total_paid_amount: 233.51,
  total_paid_currency: USD,
  expected_payout_amount: 190.32,
  expected_payout_currency: USD,
  canceled_at: null,
  created_at: null,
  updated_at: null,
  check_in_datetime: null,
  check_out_datetime: null,
  time_zone: America/Costa_Rica,
  customer_id: null,
  guest_id: null
)
```

