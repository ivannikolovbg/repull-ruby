# Repull::Reservation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull reservation ID |  |
| **listing_id** | **Integer** | Internal Repull listing ID this reservation is on. |  |
| **guest_id** | **Integer** | Internal Repull guest ID. Use &#x60;GET /v1/guests/{id}&#x60; for the full profile. |  |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** |  |  |
| **status** | **String** |  |  |
| **platform** | **String** | Booking source. Lowercase. May be null on legacy rows. | [optional] |
| **total_price** | **String** | Decimal-as-string (precision 10, scale 2) to preserve precision across mixed-currency totals. |  |
| **currency** | **String** | ISO 4217 currency code. |  |
| **confirmation_code** | **String** | Channel-side confirmation code (Airbnb HMxxx, Booking.com numeric, etc.). |  |
| **guest_details** | **Hash&lt;String, Object&gt;** | Raw guest details from the source channel (firstName, lastName, email, phone, count, etc.). Shape varies by platform — use the dedicated guest endpoint for a normalized profile. |  |
| **created_at** | **Time** | When the reservation row was created in Repull (not the booking-on-channel timestamp). |  |
| **guest_name** | **String** | Pre-resolved display name (&#x60;firstName lastName&#x60;) extracted from &#x60;guestDetails&#x60;. Null when no first name is available. | [optional] |

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
  platform: airbnb,
  total_price: 1250.00,
  currency: USD,
  confirmation_code: HMXYZ123,
  guest_details: null,
  created_at: null,
  guest_name: null
)
```

