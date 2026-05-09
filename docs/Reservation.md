# Repull::Reservation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Internal Repull reservation ID |  |
| **listing_id** | **String** | Internal Repull listing ID this reservation is on. |  |
| **guest_id** | **String** | DEPRECATED — use &#x60;primaryGuest.id&#x60;. Internal Repull guest ID. Kept populated for back-compat. | [optional] |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** |  |  |
| **status** | **String** | Lifecycle status. The API normalises a multi-decade internal taxonomy down to these four buckets, so the value you receive is always one of the enum constants. &#x60;completed&#x60; is derived from &#x60;checkOut &lt; today&#x60;. |  |
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
  status: confirmed,
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
  booked_at: null,
  guest_name: null
)
```

