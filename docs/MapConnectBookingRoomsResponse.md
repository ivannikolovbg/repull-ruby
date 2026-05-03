# Repull::MapConnectBookingRoomsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Boolean** |  |  |
| **mapped** | **Integer** | Number of rooms processed (mapped + unmapped). |  |
| **session_id** | **String** |  |  |
| **connection_id** | **String** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::MapConnectBookingRoomsResponse.new(
  success: true,
  mapped: null,
  session_id: null,
  connection_id: null
)
```

