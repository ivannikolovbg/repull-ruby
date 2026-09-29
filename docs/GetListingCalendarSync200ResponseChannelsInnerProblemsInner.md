# Repull::GetListingCalendarSync200ResponseChannelsInnerProblemsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** |  | [optional] |
| **error** | **String** | The channel&#39;s reason, in words — render it next to the night. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetListingCalendarSync200ResponseChannelsInnerProblemsInner.new(
  date: Fri Dec 18 00:00:00 UTC 2026,
  error: VRBO shows 305 instead of 293
)
```

