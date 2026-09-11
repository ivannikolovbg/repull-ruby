# Repull::PropertyAvailabilityDay

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** | The calendar date, ISO &#x60;YYYY-MM-DD&#x60;. |  |
| **available** | **Boolean** | Whether the property is bookable on this date. &#x60;false&#x60; when the calendar marks the date booked or blocked. Only dates we actually hold a calendar row for appear in &#x60;days&#x60;, so this is never a guess — a date with no data is listed in &#x60;coverage.missingDates&#x60; instead. |  |
| **price** | **Float** | Nightly price for this date in the property currency. Falls back to the property&#39;s default nightly price when the calendar row itself carries no price. |  |
| **min_nights** | **Integer** | Minimum-stay requirement for a stay starting on this date. Falls back to the listing-level default min-nights when the calendar row carries none. |  |

## Example

```ruby
require 'repull'

instance = Repull::PropertyAvailabilityDay.new(
  date: Tue Sep 01 00:00:00 UTC 2026,
  available: null,
  price: 245,
  min_nights: 2
)
```

