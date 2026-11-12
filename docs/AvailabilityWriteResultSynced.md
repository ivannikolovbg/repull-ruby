# Repull::AvailabilityWriteResultSynced

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **attempted** | **Integer** |  | [optional] |
| **succeeded** | **Integer** |  | [optional] |
| **failed** | **Integer** |  | [optional] |
| **auth_errors** | **Integer** | Channels whose token has expired — these need reconnecting, not retrying. | [optional] |
| **channels** | [**Array&lt;AvailabilityWriteResultSyncedChannelsInner&gt;**](AvailabilityWriteResultSyncedChannelsInner.md) | One entry per listing per connected channel: which channel took the write and which refused it. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AvailabilityWriteResultSynced.new(
  attempted: null,
  succeeded: null,
  failed: null,
  auth_errors: null,
  channels: null
)
```

