# Repull::TiketMapListingsRequestMappingsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_type_code** | **String** | tiket.com room type id (&#x60;rooms[].roomTypeCode&#x60; on &#x60;GET /v1/channels/tiket/properties/{id}/rooms&#x60;). |  |
| **listing_id** | **Integer** | Listing to map the room to. &#x60;null&#x60; unmaps it. | [optional] |
| **create** | **Boolean** | &#x60;true&#x60; creates a new listing from the room, with tiket.com&#39;s calendar. Do not send &#x60;listingId&#x60; with it. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketMapListingsRequestMappingsInner.new(
  room_type_code: null,
  listing_id: null,
  create: null
)
```

