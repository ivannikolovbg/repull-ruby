# Repull::MapConnectBookingRoomsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Boolean** |  |  |
| **mapped** | **Integer** | Rooms now linked to a listing. |  |
| **unmapped** | **Integer** | Rooms submitted with &#x60;listingId: null&#x60; (\&quot;don&#39;t map\&quot;), which are left without a listing. | [optional] |
| **session_id** | **String** |  |  |
| **connection_id** | **String** |  |  |
| **reservations_imported** | **Integer** | Reservations pulled from Booking.com once the rooms were mapped. Mapping triggers the same full property sync the dashboard&#39;s Sync button runs, because a reservation can only be resolved to a listing through a mapped room. &#x60;0&#x60; without a sync when no room was mapped. &#x60;null&#x60; means the sync could not be run — the connection and mapping are still good, and the property can be synced from the dashboard. | [optional] |
| **reservations_found** | **Integer** | How many reservations Booking.com returned for the property. Equal to &#x60;reservationsImported&#x60; unless some could not be attached to a listing — so &#x60;0&#x60; here means Booking.com had none. &#x60;null&#x60; when the sync could not run. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MapConnectBookingRoomsResponse.new(
  success: true,
  mapped: null,
  unmapped: null,
  session_id: null,
  connection_id: null,
  reservations_imported: null,
  reservations_found: null
)
```

