# Repull::ReservationWebhookObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Repull-internal reservation id. Pass to &#x60;GET /v1/reservations/{id}&#x60;. |  |
| **uid** | **String** | Channel-side confirmation code (Airbnb HM-prefixed, Booking.com numeric, etc.). Stable across the lifetime of the reservation. |  |
| **channel** | **String** | Source channel — &#x60;airbnb&#x60;, &#x60;booking&#x60;, &#x60;vrbo&#x60;, &#x60;direct&#x60;, &#x60;owner&#x60;, &#x60;mid_stay_clean&#x60;, etc. |  |
| **listing_id** | **Integer** | Repull listing id this reservation is on. |  |
| **customer_id** | **Integer** | Workspace (customer) id this reservation belongs to. |  |
| **checkin_date** | **Date** | Check-in date (local property date, no timezone). |  |
| **checkout_date** | **Date** | Check-out date (local property date, no timezone). |  |
| **status** | **String** | Lifecycle status — typically &#x60;confirmed&#x60;, &#x60;cancelled&#x60;, &#x60;pending&#x60;, &#x60;inquiry&#x60;. |  |
| **cancellation_policy** | **String** | Cancellation policy the booking was made under, **verbatim from the source channel** — not normalised, because the codes do not mean the same thing across channels.  - Airbnb, Vrbo, direct and owner bookings carry a named code: &#x60;flexible&#x60;, &#x60;moderate&#x60;, &#x60;firm_14&#x60;, &#x60;strict_14_with_grace_period&#x60;, &#x60;better_strict_with_grace_period&#x60;, &#x60;super_strict_30&#x60;, &#x60;super_strict_60&#x60;, &#x60;tiered_pricing_non_refundable&#x60;, &#x60;long_term_flexible&#x60;, &#x60;flexible_new&#x60;. - **Booking.com carries its numeric policy id as a string** (&#x60;\&quot;1\&quot;&#x60;, &#x60;\&quot;74\&quot;&#x60;, &#x60;\&quot;121\&quot;&#x60;). It is not self-describing — resolve it against the property&#39;s policy set on Booking.com.  &#x60;null&#x60; when the channel supplied none (iCal-imported bookings, some legacy direct rows). | [optional] |
| **check_in_time** | **String** | Local check-in time, &#x60;HH:MM&#x60; on a 24-hour clock in the **property&#39;s own timezone** — not UTC, and not the subscriber&#39;s. Usually inherited from the listing policy, but per-reservation where the channel or an agreed early check-in overrides it. &#x60;null&#x60; when unknown. | [optional] |
| **check_out_time** | **String** | Local check-out time, &#x60;HH:MM&#x60; on a 24-hour clock in the property&#39;s own timezone. Pair it with &#x60;checkoutDate&#x60; to schedule the turnover. &#x60;null&#x60; when unknown. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationWebhookObject.new(
  id: 212605,
  uid: HMX4CMA2X9,
  channel: airbnb,
  listing_id: 5668,
  customer_id: 1,
  checkin_date: Wed Jun 10 00:00:00 UTC 2026,
  checkout_date: Tue Jun 16 00:00:00 UTC 2026,
  status: confirmed,
  cancellation_policy: firm_14,
  check_in_time: 16:00,
  check_out_time: 10:00
)
```

