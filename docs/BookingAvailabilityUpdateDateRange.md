# Repull::BookingAvailabilityUpdateDateRange

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start** | **Date** | First night, YYYY-MM-DD. |  |
| **_end** | **Date** | Last night, YYYY-MM-DD, inclusive. |  |

## Example

```ruby
require 'repull'

instance = Repull::BookingAvailabilityUpdateDateRange.new(
  start: null,
  _end: null
)
```

