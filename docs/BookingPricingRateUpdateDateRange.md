# Repull::BookingPricingRateUpdateDateRange

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start** | **Date** | First night, YYYY-MM-DD. |  |
| **_end** | **Date** | Last night, YYYY-MM-DD, inclusive — the same date as &#x60;start&#x60; for a single night. |  |

## Example

```ruby
require 'repull'

instance = Repull::BookingPricingRateUpdateDateRange.new(
  start: null,
  _end: null
)
```

