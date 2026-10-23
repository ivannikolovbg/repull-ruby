# Repull::ListingPolicies

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cancellation_policy** | **String** |  | [optional] |
| **house_rules** | **String** |  | [optional] |
| **check_in** | [**ListingPoliciesCheckIn**](ListingPoliciesCheckIn.md) |  | [optional] |
| **check_out** | [**ListingPoliciesCheckOut**](ListingPoliciesCheckOut.md) |  | [optional] |
| **allows_pets** | **Boolean** |  | [optional] |
| **allows_smoking** | **Boolean** |  | [optional] |
| **allows_events** | **Boolean** |  | [optional] |
| **allows_children** | **Boolean** |  | [optional] |
| **allows_infants** | **Boolean** |  | [optional] |
| **children_min_age** | **Integer** |  | [optional] |
| **quiet_hours** | [**ListingPoliciesQuietHours**](ListingPoliciesQuietHours.md) |  | [optional] |
| **security_deposit** | **Float** | In the listing currency. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPolicies.new(
  cancellation_policy: flexible,
  house_rules: null,
  check_in: null,
  check_out: null,
  allows_pets: null,
  allows_smoking: null,
  allows_events: null,
  allows_children: null,
  allows_infants: null,
  children_min_age: null,
  quiet_hours: null,
  security_deposit: null
)
```

