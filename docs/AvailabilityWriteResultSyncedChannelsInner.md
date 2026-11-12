# Repull::AvailabilityWriteResultSyncedChannelsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **channel** | **String** | &#x60;airbnb&#x60;, &#x60;booking&#x60;, &#x60;vrbo&#x60;, or another connected channel. | [optional] |
| **channel_listing_id** | **String** | The channel&#39;s own id for the listing or room. | [optional] |
| **status** | **String** | &#x60;accepted&#x60;: the channel took the write in this request. &#x60;queued&#x60; (Vrbo): sent within minutes and read back; &#x60;GET /v1/listings/{id}/calendar-sync&#x60; shows the outcome. &#x60;failed&#x60;: the channel refused it; see &#x60;error&#x60;. | [optional] |
| **error** | **String** |  | [optional] |
| **auth_error** | **Boolean** | True when the channel&#39;s authorization has expired: reconnect, don&#39;t retry. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AvailabilityWriteResultSyncedChannelsInner.new(
  listing_id: null,
  channel: booking,
  channel_listing_id: null,
  status: null,
  error: null,
  auth_error: null
)
```

