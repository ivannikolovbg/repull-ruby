# Repull::ListingCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Public guest-facing title |  |
| **property_type** | **String** |  | [optional] |
| **street** | **String** |  | [optional] |
| **city** | **String** |  | [optional] |
| **state** | **String** |  | [optional] |
| **country_code** | **String** |  | [optional] |
| **lat** | **Float** |  | [optional] |
| **lng** | **Float** |  | [optional] |
| **bedrooms** | **Integer** |  | [optional] |
| **bathrooms** | **Float** |  | [optional] |
| **beds** | **Integer** |  | [optional] |
| **person_capacity** | **Integer** |  | [optional] |
| **summary** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **default_daily_price** | **Float** |  | [optional] |
| **cleaning_fee** | **Float** |  | [optional] |
| **cancellation_policy** | **String** |  | [optional] |
| **check_in_time_start** | **String** |  | [optional] |
| **check_out_time** | **String** |  | [optional] |
| **allows_pets** | **Boolean** |  | [optional] |
| **allows_smoking** | **Boolean** |  | [optional] |
| **allows_children** | **Boolean** |  | [optional] |
| **allows_events** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingCreateRequest.new(
  name: Sunset Loft #2,
  property_type: apartment,
  street: 123 Main St,
  city: Miami Beach,
  state: FL,
  country_code: US,
  lat: 25.7617,
  lng: -80.1918,
  bedrooms: 2,
  bathrooms: 1.5,
  beds: 2,
  person_capacity: 4,
  summary: null,
  description: null,
  default_daily_price: null,
  cleaning_fee: null,
  cancellation_policy: null,
  check_in_time_start: 15:00,
  check_out_time: 11:00,
  allows_pets: null,
  allows_smoking: null,
  allows_children: null,
  allows_events: null
)
```

