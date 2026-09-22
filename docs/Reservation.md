# Repull::Reservation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Internal Repull reservation ID |  |
| **listing_id** | **String** | Internal Repull listing ID this reservation is on. |  |
| **guest_id** | **String** | DEPRECATED — use &#x60;primaryGuest.id&#x60;. Internal Repull guest ID. Kept populated for back-compat. | [optional] |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** |  |  |
| **check_in_time** | **String** | Local check-in time for this stay, &#x60;HH:MM&#x60; on a 24-hour clock in the **property&#39;s own timezone** — not UTC. Usually inherited from the listing policy, overridden per reservation where an early check-in was agreed. &#x60;null&#x60; when unknown. This is the same field &#x60;PATCH /v1/reservations/{id}&#x60; writes. | [optional] |
| **check_out_time** | **String** | Local check-out time for this stay, &#x60;HH:MM&#x60; on a 24-hour clock in the property&#39;s own timezone. Pair with &#x60;checkOut&#x60; to schedule the turnover clean. &#x60;null&#x60; when unknown. This is the same field &#x60;PATCH /v1/reservations/{id}&#x60; writes. | [optional] |
| **status** | **String** | Lifecycle status. The API normalises a multi-decade internal taxonomy down to these four buckets, so the value you receive is always one of the enum constants. &#x60;completed&#x60; is derived from &#x60;checkOut &lt; today&#x60;. A &#x60;pending&#x60; booking request the channel already let lapse — Airbnb expires an unanswered request 24 hours after the guest asks, and no request can be answered once its check-in has passed — is reported as &#x60;cancelled&#x60; with &#x60;statusDetail: \&quot;request_expired\&quot;&#x60;, even when the channel never told us. |  |
| **status_detail** | **String** | Present only when &#x60;status&#x60; was derived rather than reported by the channel. &#x60;request_expired&#x60; — a booking request nobody answered in time (Airbnb&#39;s 24-hour window passed, or the check-in did). Absent otherwise. | [optional] |
| **respond_by** | **Time** | On a &#x60;pending&#x60; Airbnb booking request that can still be answered: when it lapses (24 hours after the guest asked). Accept or decline before then with &#x60;POST /v1/reservations/{id}/accept&#x60; / &#x60;/decline&#x60;. Absent on every other reservation. | [optional] |
| **source** | **String** | Booking source / channel. Lowercase. May be null on legacy rows. Canonical name as of 2026-05; &#x60;platform&#x60; is kept as an alias. | [optional] |
| **platform** | **String** | DEPRECATED alias for &#x60;source&#x60;. Same value, kept for back-compat. | [optional] |
| **confirmation_code** | **String** | Channel-side confirmation code (Airbnb HMxxx, Booking.com numeric, etc.). |  |
| **primary_guest** | [**ReservationPrimaryGuest**](ReservationPrimaryGuest.md) | Inline guest summary. May be undefined for owner-blocks / pre-arrival rows. | [optional] |
| **occupancy** | [**ReservationOccupancy**](ReservationOccupancy.md) | Normalized guest counts. May be undefined when the source channel did not provide counts. | [optional] |
| **financials** | [**ReservationFinancials**](ReservationFinancials.md) | Normalized money block. Always populated for paid reservations. | [optional] |
| **total_price** | **String** | DEPRECATED — use &#x60;financials.totalPrice&#x60; (a number). Decimal-as-string (precision 10, scale 2) kept for back-compat. | [optional] |
| **currency** | **String** | DEPRECATED — use &#x60;financials.currency&#x60;. ISO 4217 currency code. | [optional] |
| **guest_details** | **Hash&lt;String, Object&gt;** | DEPRECATED — use &#x60;occupancy&#x60; for normalized counts and &#x60;primaryGuest&#x60; for guest identity. Raw guest details from the source channel; shape varies by platform. | [optional] |
| **created_at** | **Time** | When the reservation row was created in Repull (not the booking-on-channel timestamp). |  |
| **updated_at** | **Time** | Last time this reservation was modified (dates, status, price, or guest details). Advances on every amendment or cancellation — poll or compare this value to reconcile changes instead of fingerprinting individual fields. |  |
| **booked_at** | **Time** | When the booking was made on the source channel (when reported by the channel). | [optional] |
| **guest_name** | **String** | Pre-resolved display name (&#x60;firstName lastName&#x60;) from the joined guest row. Undefined when no first name is available. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Reservation.new(
  id: null,
  listing_id: null,
  guest_id: null,
  check_in: Wed Apr 15 00:00:00 UTC 2026,
  check_out: Mon Apr 20 00:00:00 UTC 2026,
  check_in_time: 16:00,
  check_out_time: 10:00,
  status: confirmed,
  status_detail: request_expired,
  respond_by: 2026-09-23T09:00Z,
  source: airbnb,
  platform: airbnb,
  confirmation_code: HMXYZ123,
  primary_guest: null,
  occupancy: null,
  financials: null,
  total_price: 1250.00,
  currency: USD,
  guest_details: null,
  created_at: null,
  updated_at: null,
  booked_at: null,
  guest_name: null
)
```

