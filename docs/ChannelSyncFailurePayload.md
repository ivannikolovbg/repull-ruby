# Repull::ChannelSyncFailurePayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ChannelSyncFailurePayloadObject**](ChannelSyncFailurePayloadObject.md) |  |  |
| **failures** | [**Array&lt;ChannelSyncFailurePayloadFailuresInner&gt;**](ChannelSyncFailurePayloadFailuresInner.md) | One entry per channel mapping that refused the push. |  |
| **reservation_id** | **Integer** | Set when the push was blocking dates for a booking just taken. Those nights are sold on one channel and still open on another — treat as urgent. | [optional] |
| **occurred_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ChannelSyncFailurePayload.new(
  object: null,
  failures: null,
  reservation_id: null,
  occurred_at: null
)
```

