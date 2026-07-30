# Repull::MapAirbnbListingRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **airbnb_id** | **String** | The Airbnb listing id to map. Discover it via &#x60;GET /v1/channels/airbnb/listings&#x60;. |  |
| **listing_id** | **Integer** | Canonical Repull listing id to link the Airbnb listing to. Must belong to your workspace. A numeric string is also accepted. |  |
| **host_id** | **String** | Optional. When present, must match the Airbnb listing&#39;s host id — guards against mapping the wrong host&#39;s listing. | [optional] |
| **sync_enabled** | **Boolean** | Whether the resulting platform link has sync enabled. | [optional][default to true] |

## Example

```ruby
require 'repull'

instance = Repull::MapAirbnbListingRequest.new(
  airbnb_id: null,
  listing_id: null,
  host_id: null,
  sync_enabled: null
)
```

