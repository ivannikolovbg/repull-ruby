# Repull::PromotionCatalogChannelsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  | [optional] |
| **connected** | **Boolean** |  | [optional] |
| **reason** | **String** |  | [optional] |
| **properties** | **Array&lt;String&gt;** | Booking.com properties the listing has a room on. | [optional] |
| **entries** | [**Array&lt;PromotionCatalogEntry&gt;**](PromotionCatalogEntry.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionCatalogChannelsInner.new(
  channel: null,
  connected: null,
  reason: null,
  properties: null,
  entries: null
)
```

