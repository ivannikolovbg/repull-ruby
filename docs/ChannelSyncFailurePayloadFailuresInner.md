# Repull::ChannelSyncFailurePayloadFailuresInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  | [optional] |
| **external_listing_id** | **String** | The channel&#39;s own id for the room or listing. | [optional] |
| **kind** | **String** | &#x60;unknown&#x60; means we could not classify it — never that the channel refused. | [optional] |
| **message** | **String** | The channel&#39;s own message, verbatim. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ChannelSyncFailurePayloadFailuresInner.new(
  channel: airbnb,
  external_listing_id: null,
  kind: null,
  message: null
)
```

