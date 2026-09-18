# Repull::UpdateAirbnbListingAmenitiesRequestAccessibilityAmenitiesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **is_present** | **Boolean** |  |  |
| **instruction** | **String** |  | [optional] |
| **photo_ids** | **Array&lt;String&gt;** | Airbnb photo ids evidencing the accessibility claim (&#x60;photoAirbnbId&#x60; from &#x60;GET /photos&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbListingAmenitiesRequestAccessibilityAmenitiesInner.new(
  id: null,
  is_present: null,
  instruction: null,
  photo_ids: null
)
```

