# Repull::AirbnbListingDetailsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_airbnb_id** | **String** |  | [optional] |
| **name** | **String** |  | [optional] |
| **property_type_group** | **String** |  | [optional] |
| **property_type_category** | **String** |  | [optional] |
| **room_type_category** | **String** |  | [optional] |
| **person_capacity** | **Integer** |  | [optional] |
| **bedrooms** | **Integer** |  | [optional] |
| **beds** | **Integer** |  | [optional] |
| **bathrooms** | **String** |  | [optional] |
| **has_availability** | **Boolean** | Whether the Airbnb listing is live. &#x60;false&#x60; means unlisted on Airbnb — unrelated to the Repull record being active. | [optional] |
| **check_in_option** | **Hash&lt;String, Object&gt;** | &#x60;{ category, instruction }&#x60; — how the guest gets in. | [optional] |
| **listing_nickname** | **String** |  | [optional] |
| **locked_fields** | **Array&lt;String&gt;** | Attributes Airbnb refuses to change on this listing. | [optional] |
| **updated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbListingDetailsResponse.new(
  listing_airbnb_id: null,
  name: null,
  property_type_group: null,
  property_type_category: null,
  room_type_category: null,
  person_capacity: null,
  bedrooms: null,
  beds: null,
  bathrooms: null,
  has_availability: null,
  check_in_option: null,
  listing_nickname: null,
  locked_fields: null,
  updated_at: null
)
```

