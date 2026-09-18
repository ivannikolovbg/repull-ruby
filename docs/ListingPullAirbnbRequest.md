# Repull::ListingPullAirbnbRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **airbnb_connection_id** | **String** | Pull through this specific Airbnb connection instead of the listing&#39;s primary one. Use when a listing carries several connections (merged properties, host migrations) — the ids come from &#x60;GET /v1/listings/{id}/publish-status&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPullAirbnbRequest.new(
  airbnb_connection_id: null
)
```

