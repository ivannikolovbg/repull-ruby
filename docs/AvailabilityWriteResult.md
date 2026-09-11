# Repull::AvailabilityWriteResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_ids** | **Array&lt;String&gt;** |  | [optional] |
| **dates** | **Integer** | How many dates were written. | [optional] |
| **synced** | [**AvailabilityWriteResultSynced**](AvailabilityWriteResultSynced.md) |  | [optional] |
| **warning** | **String** | Present only when one or more channel pushes failed. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AvailabilityWriteResult.new(
  listing_ids: null,
  dates: null,
  synced: null,
  warning: null
)
```

