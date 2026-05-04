# Repull::CalendarUpdatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** |  | [optional] |
| **range** | [**CalendarUpdatedPayloadRange**](CalendarUpdatedPayloadRange.md) |  | [optional] |
| **affected_dates** | **Integer** |  | [optional] |
| **pricing_changed** | **Boolean** |  | [optional] |
| **availability_changed** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CalendarUpdatedPayload.new(
  listing_id: 6250,
  range: null,
  affected_dates: 14,
  pricing_changed: true,
  availability_changed: false
)
```

