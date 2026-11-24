# Repull::TiketConnectMapRoomsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Boolean** |  | [optional] |
| **session_id** | **String** |  | [optional] |
| **connection_id** | **String** |  | [optional] |
| **mapped** | **Integer** |  | [optional] |
| **unmapped** | **Integer** |  | [optional] |
| **created** | **Integer** | Listings created from rooms (&#x60;create: true&#x60;). | [optional] |
| **replayed_reservations** | **Integer** | Bookings tiket.com delivered before the rooms were mapped, now recorded. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketConnectMapRoomsResponse.new(
  success: null,
  session_id: null,
  connection_id: null,
  mapped: null,
  unmapped: null,
  created: null,
  replayed_reservations: null
)
```

