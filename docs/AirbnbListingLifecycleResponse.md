# Repull::AirbnbListingLifecycleResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull listing id. | [optional] |
| **action** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **airbnb_connection_id** | **String** |  | [optional] |
| **live** | **Boolean** | Whether the Airbnb listing is taking bookings after this call. &#x60;false&#x60; after &#x60;unlist&#x60;, &#x60;true&#x60; after &#x60;relist&#x60;. | [optional] |
| **verified** | **Boolean** | True when the result was confirmed by reading the listing back from Airbnb (done on &#x60;unlist&#x60;: Airbnb accepting the call is not proof the listing came down). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbListingLifecycleResponse.new(
  id: null,
  action: null,
  channel: null,
  airbnb_connection_id: null,
  live: null,
  verified: null
)
```

