# Repull::PropertyAvailabilityDay

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** | The calendar date, ISO &#x60;YYYY-MM-DD&#x60;. |  |
| **available** | **Boolean** | Whether the property is bookable on this date. &#x60;false&#x60; when the channel calendar marks the date unavailable (stop-sell / blocked). |  |
| **price** | **Float** | Nightly price for this date in the property currency. Falls back to the property&#39;s default nightly price for dates with no explicit calendar override. |  |
| **min_nights** | **Integer** | Minimum-stay requirement for a stay starting on this date. |  |

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

