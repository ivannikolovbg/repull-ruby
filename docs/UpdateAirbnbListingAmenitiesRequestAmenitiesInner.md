# Repull::UpdateAirbnbListingAmenitiesRequestAmenitiesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb amenity id, e.g. &#x60;wireless_internet&#x60;. Case is ignored. |  |
| **is_present** | **Boolean** | &#x60;true&#x60; claims the amenity, &#x60;false&#x60; removes it. Required — an amenity with no &#x60;is_present&#x60; would be a silent no-op. |  |
| **instruction** | **String** | Optional host note shown with the amenity. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbListingAmenitiesRequestAmenitiesInner.new(
  id: null,
  is_present: null,
  instruction: null
)
```

