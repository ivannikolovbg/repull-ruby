# Repull::ListingPublishAirbnbRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **airbnb_connection_id** | **Integer** | Existing Airbnb connection row id | [optional] |
| **host_id** | **String** | Airbnb host id (required for first-time creates) | [optional] |
| **force** | **Boolean** | Re-push every section, ignoring dirty-fields tracking | [optional][default to false] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPublishAirbnbRequest.new(
  airbnb_connection_id: null,
  host_id: null,
  force: null
)
```

