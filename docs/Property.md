# Repull::Property

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull property ID | [optional] |
| **external_id** | **String** | ID in the source PMS | [optional] |
| **name** | **String** | Property name | [optional] |
| **address** | **String** | Full address | [optional] |
| **city** | **String** |  | [optional] |
| **state** | **String** |  | [optional] |
| **country** | **String** |  | [optional] |
| **latitude** | **Float** |  | [optional] |
| **longitude** | **Float** |  | [optional] |
| **bedrooms** | **Integer** |  | [optional] |
| **bathrooms** | **Float** |  | [optional] |
| **max_guests** | **Integer** |  | [optional] |
| **thumbnail** | **String** | Primary photo URL | [optional] |
| **provider** | **String** | Source PMS | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Property.new(
  id: null,
  external_id: null,
  name: Oceanview Suite #3,
  address: null,
  city: Miami Beach,
  state: FL,
  country: US,
  latitude: 25.7617,
  longitude: -80.1918,
  bedrooms: 2,
  bathrooms: 1.5,
  max_guests: 6,
  thumbnail: null,
  provider: hostaway
)
```

