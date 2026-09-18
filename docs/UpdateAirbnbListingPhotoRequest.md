# Repull::UpdateAirbnbListingPhotoRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **photo_id** | **String** | Airbnb-side photo id — the &#x60;photoAirbnbId&#x60; from &#x60;GET /photos&#x60;. |  |
| **caption** | **String** | New caption, or &#x60;null&#x60; to clear it. | [optional] |
| **sort_order** | **Integer** | Position in the tour. Relative, not absolute — lower sorts earlier. | [optional] |
| **room_id** | **String** | Airbnb room id to file the photo under (&#x60;roomId&#x60; from &#x60;GET /rooms&#x60;), or &#x60;null&#x60; to detach it. | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | At most 10 pairs; keys 40 characters or fewer. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbListingPhotoRequest.new(
  photo_id: null,
  caption: null,
  sort_order: null,
  room_id: null,
  metadata: null
)
```

