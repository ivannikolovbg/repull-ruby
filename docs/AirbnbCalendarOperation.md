# Repull::AirbnbCalendarOperation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Inclusive range start, YYYY-MM-DD. Send together with &#x60;end_date&#x60;. | [optional] |
| **end_date** | **Date** | Inclusive range end, YYYY-MM-DD, on or after &#x60;start_date&#x60;. | [optional] |
| **dates** | **Array&lt;String&gt;** | Dates as &#x60;YYYY-MM-DD&#x60;, or inclusive ranges as &#x60;YYYY-MM-DD:YYYY-MM-DD&#x60; — an alternative to &#x60;start_date&#x60;/&#x60;end_date&#x60;. | [optional] |
| **daily_price** | **Float** | Nightly price override, in the listing currency. | [optional] |
| **availability** | **String** | Stop-sell is expressed here: &#x60;unavailable&#x60; blocks the date(s); &#x60;available&#x60; re-opens; &#x60;default&#x60; reverts to rule-based availability. | [optional] |
| **busy_subtype** | **String** | Why a blocked date is blocked. Airbnb requires it whenever &#x60;availability&#x60; is &#x60;unavailable&#x60;; when you leave it out, Repull sends **&#x60;BLOCKED_BY_HOST&#x60;**. Use &#x60;OUTSIDE_RESERVATION&#x60; for a date held by a booking made on another channel. | [optional] |
| **min_nights** | **Integer** | Minimum length of stay for the date(s). | [optional] |
| **max_nights** | **Integer** | Maximum length of stay for the date(s); no lower than &#x60;min_nights&#x60;. | [optional] |
| **closed_to_arrival** | **Boolean** | Closed-to-arrival — no check-ins on the affected date(s). | [optional] |
| **closed_to_departure** | **Boolean** | Closed-to-departure — no check-outs on the affected date(s). | [optional] |
| **notes** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbCalendarOperation.new(
  start_date: null,
  end_date: null,
  dates: null,
  daily_price: null,
  availability: null,
  busy_subtype: null,
  min_nights: null,
  max_nights: null,
  closed_to_arrival: null,
  closed_to_departure: null,
  notes: null
)
```

