# Repull::AirbnbListingActionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** | &#x60;delete&#x60; deactivates the REPULL RECORD — billing and API visibility — and never calls Airbnb. &#x60;push&#x60;/&#x60;publish&#x60; push content to Airbnb. &#x60;unlist&#x60; takes the LIVE AIRBNB LISTING down so it stops taking bookings; &#x60;relist&#x60; puts it back up. Deactivating and unlisting are different operations with different blast radii and are deliberately different action names. |  |
| **airbnb_connection_id** | **String** | For &#x60;push&#x60;/&#x60;publish&#x60;: the Airbnb connection to update (from &#x60;GET /v1/channels/airbnb/listings/{id}&#x60;). Pass this OR &#x60;hostId&#x60;. REQUIRED for &#x60;unlist&#x60;/&#x60;relist&#x60;: a listing can be connected to more than one Airbnb listing and the wrong one cannot be un-taken-down through this API. | [optional] |
| **host_id** | **String** | For &#x60;push&#x60;/&#x60;publish&#x60;: create + publish a new Airbnb listing under this host. Pass this OR &#x60;airbnbConnectionId&#x60;. | [optional] |
| **force** | **Boolean** | For &#x60;push&#x60;/&#x60;publish&#x60;: re-push every field, ignoring dirty-field tracking. | [optional][default to false] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbListingActionRequest.new(
  action: null,
  airbnb_connection_id: null,
  host_id: null,
  force: null
)
```

