# Repull::CalendarDay

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** |  | [optional] |
| **available** | **Boolean** |  | [optional] |
| **price** | **Float** |  | [optional] |
| **min_nights** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CalendarDay.new(
  date: Wed Apr 15 00:00:00 UTC 2026,
  available: null,
  price: 250,
  min_nights: 2
)
```

