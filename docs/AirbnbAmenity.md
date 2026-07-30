# Repull::AirbnbAmenity

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb amenity id (e.g. &#x60;wifi&#x60;, &#x60;bathroom_step_free_access&#x60;). | [optional] |
| **is_present** | **Boolean** | Whether the amenity is present on the listing. | [optional] |
| **instruction** | **String** | Optional host-supplied instruction for the amenity. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbAmenity.new(
  id: null,
  is_present: null,
  instruction: null
)
```

