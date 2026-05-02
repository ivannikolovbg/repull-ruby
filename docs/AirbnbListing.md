# Repull::AirbnbListing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Airbnb listing ID | [optional] |
| **name** | **String** | Listing title | [optional] |
| **status** | **String** | Listing status (active, unlisted, etc.) | [optional] |
| **property_type** | **String** |  | [optional] |
| **room_type** | **String** |  | [optional] |
| **bedrooms** | **Integer** |  | [optional] |
| **bathrooms** | **Float** |  | [optional] |
| **max_guests** | **Integer** |  | [optional] |
| **thumbnail_url** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbListing.new(
  id: 12345678,
  name: null,
  status: null,
  property_type: null,
  room_type: null,
  bedrooms: null,
  bathrooms: null,
  max_guests: null,
  thumbnail_url: null
)
```

