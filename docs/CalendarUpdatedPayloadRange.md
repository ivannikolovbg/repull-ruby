# Repull::CalendarUpdatedPayloadRange

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start** | **Date** |  | [optional] |
| **_end** | **Date** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CalendarUpdatedPayloadRange.new(
  start: Mon Jun 01 00:00:00 UTC 2026,
  _end: Mon Jun 15 00:00:00 UTC 2026
)
```

