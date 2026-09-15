# Repull::MapConnectBookingRoomsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Boolean** |  |  |
| **mapped** | **Integer** | Number of rooms processed (mapped + unmapped). |  |
| **session_id** | **String** |  |  |
| **connection_id** | **String** |  |  |
| **reservations_imported** | **Integer** | Reservations pulled from Booking.com once the rooms were mapped. Mapping triggers the same full property sync the dashboard&#39;s Sync button runs, because a reservation can only be resolved to a listing through a mapped room. &#x60;null&#x60; means the sync could not be run — the connection and mapping are still good, and the property can be synced from the dashboard. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MapConnectBookingRoomsResponse.new(
  success: true,
  mapped: null,
  session_id: null,
  connection_id: null,
  reservations_imported: null
)
```

