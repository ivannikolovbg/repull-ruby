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
  status: confirmed
)
```

