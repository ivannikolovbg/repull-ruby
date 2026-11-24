# Repull::AirbnbReservationDetail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The unified reservation id (same as &#x60;reservationId&#x60;). |  |
| **reservation_id** | **String** | The unified reservation id: &#x60;GET /v1/reservations/{id}&#x60;. |  |
| **confirmation_code** | **String** |  |  |
| **listing_id** | **String** | The Repull listing id. |  |
| **airbnb_listing_id** | **String** | Airbnb&#39;s own listing id. |  |
| **account_id** | **String** | The connected Airbnb account (host id, as a string). |  |
| **account_name** | **String** |  |  |
| **guest_id** | **String** |  | [optional] |
| **platform** | **String** |  | [optional] |
| **pms_source** | **String** |  | [optional] |
| **booking_reservation_number** | **String** |  | [optional] |
| **unit_external_id** | **String** |  | [optional] |
| **unit_name** | **String** |  | [optional] |
| **status** | **String** | Airbnb&#39;s status as stored on the reservation (&#x60;accept&#x60;, &#x60;cancelled&#x60;, &#x60;decline&#x60;, &#x60;pending_voided&#x60;, …). The normalised value is &#x60;airbnb.status&#x60;. |  |
| **payment_status** | **String** |  | [optional] |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** |  |  |
| **guest_details** | **Hash&lt;String, Object&gt;** | Guest counts: &#x60;numberOfGuests&#x60;, &#x60;numberOfAdults&#x60;, &#x60;numberOfChildren&#x60;, &#x60;numberOfInfants&#x60;, &#x60;numberOfPets&#x60;. | [optional] |
| **guest_name** | **String** |  |  |
| **guest_count** | **Integer** |  |  |
| **total_price** | **String** | Total as a decimal string, in &#x60;currency&#x60;. |  |
| **currency** | **String** |  |  |
| **payout** | **Float** | What the host is expected to receive, in &#x60;payoutCurrency&#x60;. |  |
| **payout_currency** | **String** |  |  |
| **price_breakdown** | **Hash&lt;String, Object&gt;** | Nightly rates, fees, taxes, discounts, &#x60;hostPayout&#x60;. | [optional] |
| **custom_fields** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **cancellation_policy** | **String** |  | [optional] |
| **cancellation_reason** | **String** |  | [optional] |
| **cancellation_date** | **Time** |  | [optional] |
| **host_notes** | **String** |  | [optional] |
| **guest_notes** | **String** |  | [optional] |
| **internal_notes** | **String** |  | [optional] |
| **time_zone** | **String** |  | [optional] |
| **check_in_time** | **String** |  | [optional] |
| **check_out_time** | **String** |  | [optional] |
| **customer_id** | **String** |  | [optional] |
| **airbnb_host_id** | **String** | Use &#x60;accountId&#x60;. | [optional] |
| **booked_at** | **Time** |  | [optional] |
| **airbnb** | [**AirbnbReservation**](AirbnbReservation.md) | The Airbnb record, in the list endpoint&#39;s shape. Null only while it is still being imported. |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbReservationDetail.new(
  id: 667929,
  reservation_id: 667929,
  confirmation_code: HMAS8FEPJM,
  listing_id: 42343,
  airbnb_listing_id: null,
  account_id: null,
  account_name: null,
  guest_id: null,
  platform: airbnb,
  pms_source: null,
  booking_reservation_number: null,
  unit_external_id: null,
  unit_name: null,
  status: accept,
  payment_status: paid,
  check_in: null,
  check_out: null,
  guest_details: null,
  guest_name: null,
  guest_count: null,
  total_price: 245.03,
  currency: EUR,
  payout: null,
  payout_currency: null,
  price_breakdown: null,
  custom_fields: null,
  cancellation_policy: null,
  cancellation_reason: null,
  cancellation_date: null,
  host_notes: null,
  guest_notes: null,
  internal_notes: null,
  time_zone: null,
  check_in_time: null,
  check_out_time: null,
  customer_id: null,
  airbnb_host_id: null,
  booked_at: null,
  airbnb: null
)
```

