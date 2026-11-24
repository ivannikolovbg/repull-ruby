# Repull::MapTiketConnectRoomsRequestMappingsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **Integer** | &#x60;rooms[].roomId&#x60; from &#x60;GET /v1/connect/tiket/rooms&#x60;. |  |
| **listing_id** | **Integer** |  | [optional] |
| **create** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MapTiketConnectRoomsRequestMappingsInner.new(
  room_id: null,
  listing_id: null,
  create: null
)
```

