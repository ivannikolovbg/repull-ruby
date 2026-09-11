# Repull::PropertyAvailabilityCoverage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **requested_days** | **Integer** | Number of dates in the requested &#x60;[from, to]&#x60; window, after the 366-day cap. |  |
| **covered_days** | **Integer** | Number of those dates present in &#x60;days&#x60;. |  |
| **missing_dates** | **Array&lt;Date&gt;** | Requested dates with no calendar row, ascending. Availability for these dates is UNKNOWN — do not treat them as bookable. |  |

## Example

```ruby
require 'repull'

instance = Repull::PropertyAvailabilityCoverage.new(
  requested_days: 30,
  covered_days: 30,
  missing_dates: []
)
```

