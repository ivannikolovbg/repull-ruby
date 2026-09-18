# Repull::UpdateAirbnbListingAmenitiesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amenities** | [**Array&lt;UpdateAirbnbListingAmenitiesRequestAmenitiesInner&gt;**](UpdateAirbnbListingAmenitiesRequestAmenitiesInner.md) |  | [optional] |
| **accessibility_amenities** | [**Array&lt;UpdateAirbnbListingAmenitiesRequestAccessibilityAmenitiesInner&gt;**](UpdateAirbnbListingAmenitiesRequestAccessibilityAmenitiesInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbListingAmenitiesRequest.new(
  amenities: null,
  accessibility_amenities: null
)
```

