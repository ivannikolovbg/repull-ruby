# Repull::ListingPublishStatusResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **channels** | [**Array&lt;ListingPublishStatusChannel&gt;**](ListingPublishStatusChannel.md) | Sync activity per channel — empty if the listing has never been pushed/pulled. Empty does NOT mean \&quot;not connected\&quot;; check &#x60;connections&#x60; for that. | [optional] |
| **connections** | [**Array&lt;ListingPublishStatusConnection&gt;**](ListingPublishStatusConnection.md) | Connection state per channel. Populated even when &#x60;channels&#x60; is empty so callers can distinguish \&quot;owned, never pushed\&quot; from \&quot;owned, never connected\&quot;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPublishStatusResponse.new(
  listing_id: null,
  channels: null,
  connections: null
)
```

