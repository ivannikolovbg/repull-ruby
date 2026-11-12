# Repull::AvailabilityWriteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **available** | **Boolean** | Block or unblock the dates. | [optional] |
| **price** | **Float** | Nightly base price. | [optional] |
| **min_nights** | **Integer** |  | [optional] |
| **max_nights** | **Integer** | Maximum stay for an arrival on these dates. Sent to Airbnb and Booking.com. Vrbo has no per-date maximum stay, so it is not sent there. | [optional] |
| **closed_to_arrival** | **Boolean** | No check-in on these dates (&#x60;true&#x60;), or check-in allowed again (&#x60;false&#x60;). Sent to Airbnb, Booking.com and Vrbo. Leaving it out keeps the current value. | [optional] |
| **closed_to_departure** | **Boolean** | No check-out on these dates (&#x60;true&#x60;), or check-out allowed again (&#x60;false&#x60;). Sent to Airbnb, Booking.com and Vrbo. Leaving it out keeps the current value. | [optional] |
| **available_units** | **Integer** | Rooms to sell on these dates, for a listing that sells several identical rooms (&#x60;unitCount&#x60; &gt; 1, e.g. a Booking.com room type). Up to the listing&#39;s &#x60;unitCount&#x60;. Refused with &#x60;409 managed_by_pms&#x60; on a hotel PMS room type (Cloudbeds, Mews) — its PMS owns the room count. | [optional] |
| **dates** | **Array&lt;Date&gt;** | ISO dates. Capped at 731 — Airbnb refuses calendar writes spanning more. |  |

## Example

```ruby
require 'repull'

instance = Repull::AvailabilityWriteRequest.new(
  available: null,
  price: null,
  min_nights: null,
  max_nights: null,
  closed_to_arrival: null,
  closed_to_departure: null,
  available_units: null,
  dates: null
)
```

