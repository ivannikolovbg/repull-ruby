# Repull::ListingMarketStateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **state** | **String** | The state you asked for. Compare each item&#39;s own &#x60;state&#x60; against it. |  |
| **channels** | [**Array&lt;ChannelMarketStateItem&gt;**](ChannelMarketStateItem.md) | One entry per channel item acted on — Airbnb connections first, then the Booking.com property. Never empty: a listing connected to nothing is refused with &#x60;422 no_connected_channels&#x60; rather than answered with an empty array. |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingMarketStateResponse.new(
  listing_id: null,
  state: null,
  channels: null
)
```

