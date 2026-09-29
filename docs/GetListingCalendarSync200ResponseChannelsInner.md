# Repull::GetListingCalendarSync200ResponseChannelsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  |  |
| **platform_id** | **String** | The listing&#39;s id on the channel. |  |
| **sync_enabled** | **Boolean** | Calendar pushes to this channel are on. |  |
| **status** | **String** | &#x60;in_sync&#x60; — no future night has a problem; &#x60;problems&#x60; — see &#x60;problems&#x60;; &#x60;off&#x60; — calendar sync is off for this channel. |  |
| **last_sync_at** | **Time** | When a push last wrote to this listing&#39;s calendar. |  |
| **nights_with_problems** | **Integer** |  |  |
| **problems** | [**Array&lt;GetListingCalendarSync200ResponseChannelsInnerProblemsInner&gt;**](GetListingCalendarSync200ResponseChannelsInnerProblemsInner.md) |  |  |
| **queue** | [**GetListingCalendarSync200ResponseChannelsInnerQueue**](GetListingCalendarSync200ResponseChannelsInnerQueue.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetListingCalendarSync200ResponseChannelsInner.new(
  channel: vrbo,
  platform_id: 5121372,
  sync_enabled: null,
  status: null,
  last_sync_at: null,
  nights_with_problems: 0,
  problems: null,
  queue: null
)
```

