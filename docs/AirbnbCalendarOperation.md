# Repull::AirbnbCalendarOperation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Inclusive range start (pair with &#x60;end_date&#x60;). | [optional] |
| **end_date** | **Date** | Inclusive range end (pair with &#x60;start_date&#x60;). | [optional] |
| **dates** | **Array&lt;String&gt;** | Explicit date or &#x60;start:end&#x60; range strings, as an alternative to &#x60;start_date&#x60;/&#x60;end_date&#x60;. | [optional] |
| **daily_price** | **Float** | Nightly price override. | [optional] |
| **availability** | **String** | Stop-sell is expressed here: &#x60;unavailable&#x60; blocks the date(s); &#x60;available&#x60; re-opens; &#x60;default&#x60; reverts to rule-based availability. | [optional] |
| **min_nights** | **Integer** | Minimum length of stay for the date(s). | [optional] |
| **max_nights** | **Integer** | Maximum length of stay for the date(s). | [optional] |
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
  min_nights: null,
  max_nights: null,
  closed_to_arrival: null,
  closed_to_departure: null,
  notes: null
)
```

