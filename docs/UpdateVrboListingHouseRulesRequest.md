# Repull::UpdateVrboListingHouseRulesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_in_time** | **String** |  | [optional] |
| **check_out_time** | **String** |  | [optional] |
| **max_guests** | **Integer** |  | [optional] |
| **max_adults** | **Integer** |  | [optional] |
| **occupancy_note** | **String** |  | [optional] |
| **minimum_age** | **Integer** |  | [optional] |
| **minimum_age_note** | **String** |  | [optional] |
| **children** | [**UpdateVrboListingHouseRulesRequestChildren**](UpdateVrboListingHouseRulesRequestChildren.md) |  | [optional] |
| **pets** | [**UpdateVrboListingHouseRulesRequestPets**](UpdateVrboListingHouseRulesRequestPets.md) |  | [optional] |
| **smoking** | [**UpdateVrboListingHouseRulesRequestSmoking**](UpdateVrboListingHouseRulesRequestSmoking.md) |  | [optional] |
| **events** | [**UpdateVrboListingHouseRulesRequestEvents**](UpdateVrboListingHouseRulesRequestEvents.md) |  | [optional] |
| **custom_rules** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingHouseRulesRequest.new(
  check_in_time: 16:00,
  check_out_time: 16:00,
  max_guests: null,
  max_adults: null,
  occupancy_note: null,
  minimum_age: null,
  minimum_age_note: null,
  children: null,
  pets: null,
  smoking: null,
  events: null,
  custom_rules: null
)
```

