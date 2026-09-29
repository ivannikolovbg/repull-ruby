# Repull::GetListingCalendarSync200ResponseChannelsInnerQueue

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **state** | **String** |  | [optional] |
| **queued_nights** | **Integer** | Nights waiting to be pushed. | [optional] |
| **queued_at** | **Time** |  | [optional] |
| **last_push** | [**GetListingCalendarSync200ResponseChannelsInnerQueueLastPush**](GetListingCalendarSync200ResponseChannelsInnerQueueLastPush.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetListingCalendarSync200ResponseChannelsInnerQueue.new(
  state: null,
  queued_nights: null,
  queued_at: null,
  last_push: null
)
```

