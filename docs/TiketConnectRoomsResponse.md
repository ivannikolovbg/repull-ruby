# Repull::TiketConnectRoomsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | &#x60;importing&#x60; — room types are still being read; &#x60;ready&#x60; — awaiting mapping; &#x60;completed&#x60; — the session is finished. |  |
| **session_id** | **String** |  |  |
| **hotel_id** | **String** |  |  |
| **rooms** | [**Array&lt;TiketConnectRoomsResponseRoomsInner&gt;**](TiketConnectRoomsResponseRoomsInner.md) |  |  |
| **listing_options** | [**Array&lt;BookingConnectListingOption&gt;**](BookingConnectListingOption.md) |  |  |
| **listing_options_total** | **Integer** |  | [optional] |
| **missing_capabilities** | **Array&lt;String&gt;** | Always empty for tiket.com. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketConnectRoomsResponse.new(
  status: null,
  session_id: null,
  hotel_id: null,
  rooms: null,
  listing_options: null,
  listing_options_total: null,
  missing_capabilities: null
)
```

