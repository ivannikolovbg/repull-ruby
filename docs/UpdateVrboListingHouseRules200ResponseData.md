# Repull::UpdateVrboListingHouseRules200ResponseData

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
| **children** | [**GetVrboListingContent200ResponseSectionsHouseRulesChildren**](GetVrboListingContent200ResponseSectionsHouseRulesChildren.md) |  | [optional] |
| **pets** | [**GetVrboListingContent200ResponseSectionsHouseRulesPets**](GetVrboListingContent200ResponseSectionsHouseRulesPets.md) |  | [optional] |
| **smoking** | [**GetVrboListingContent200ResponseSectionsHouseRulesSmoking**](GetVrboListingContent200ResponseSectionsHouseRulesSmoking.md) |  | [optional] |
| **events** | [**GetVrboListingContent200ResponseSectionsHouseRulesEvents**](GetVrboListingContent200ResponseSectionsHouseRulesEvents.md) |  | [optional] |
| **custom_rules** | **Array&lt;String&gt;** |  | [optional] |
| **rental_agreement** | **Object** |  | [optional] |
| **time_options** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingHouseRules200ResponseData.new(
  check_in_time: null,
  check_out_time: null,
  max_guests: null,
  max_adults: null,
  occupancy_note: null,
  minimum_age: null,
  minimum_age_note: null,
  children: null,
  pets: null,
  smoking: null,
  events: null,
  custom_rules: null,
  rental_agreement: null,
  time_options: null
)
```

