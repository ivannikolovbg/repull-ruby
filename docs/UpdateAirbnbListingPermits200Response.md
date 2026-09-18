# Repull::UpdateAirbnbListingPermits200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **airbnb_listing_id** | **String** |  | [optional] |
| **permits** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | The permit flows as Airbnb reports them after the write, including each flow&#39;s new &#x60;status&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbListingPermits200Response.new(
  listing_id: null,
  airbnb_listing_id: null,
  permits: null
)
```

