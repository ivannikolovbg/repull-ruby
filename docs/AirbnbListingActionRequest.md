# Repull::AirbnbListingActionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** | &#x60;delete&#x60; deactivates the Repull record. &#x60;push&#x60;/&#x60;publish&#x60; push content to Airbnb. |  |
| **airbnb_connection_id** | **String** | For &#x60;push&#x60;/&#x60;publish&#x60;: the Airbnb connection to update (from &#x60;GET /v1/channels/airbnb/listings/{id}&#x60;). Pass this OR &#x60;hostId&#x60;. | [optional] |
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

