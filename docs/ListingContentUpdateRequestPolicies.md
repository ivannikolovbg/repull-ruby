# Repull::ListingContentUpdateRequestPolicies

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_in_time_start** | **String** | e.g. \&quot;15\&quot; (3pm). | [optional] |
| **check_in_time_end** | **String** |  | [optional] |
| **check_out_time** | **String** | e.g. \&quot;11\&quot; (11am). | [optional] |
| **house_rules** | **String** | Free-text house rules. | [optional] |
| **cancellation_policy** | **String** | Cancellation policy slug/label. | [optional] |
| **cancellation** | **String** | Alias for &#x60;cancellationPolicy&#x60;. | [optional] |
| **allows_children** | **Boolean** |  | [optional] |
| **allows_infants** | **Boolean** |  | [optional] |
| **allows_pets** | **Boolean** |  | [optional] |
| **allows_smoking** | **Boolean** |  | [optional] |
| **allows_events** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateRequestPolicies.new(
  check_in_time_start: null,
  check_in_time_end: null,
  check_out_time: null,
  house_rules: null,
  cancellation_policy: null,
  cancellation: null,
  allows_children: null,
  allows_infants: null,
  allows_pets: null,
  allows_smoking: null,
  allows_events: null
)
```

