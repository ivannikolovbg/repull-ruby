# Repull::AirbnbConnectionAmenitiesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb amenity id (e.g. &#x60;wifi&#x60;, &#x60;kitchen&#x60;). | [optional] |
| **is_present** | **Boolean** |  | [optional] |
| **instruction** | **String** | Host-supplied instruction for the amenity (e.g. \&quot;WiFi password is on the fridge\&quot;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbConnectionAmenitiesInner.new(
  id: null,
  is_present: null,
  instruction: null
)
```

