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
| **quiet_hours_start** | **String** | Quiet-hours window start, e.g. \&quot;22:00\&quot;. Distributed to Airbnb by the publish path. | [optional] |
| **quiet_hours_end** | **String** |  | [optional] |
| **check_in_method** | **String** | How the guest lets themselves in. Canonical storage only — distributing it to Airbnb is &#x60;PUT /v1/channels/airbnb/listings/{id}/details&#x60; with &#x60;check_in_option&#x60;. | [optional] |
| **check_in_instruction** | **String** | Instruction shown with the check-in method. | [optional] |
| **guest_safety_disclosures** | [**Array&lt;AirbnbSafetyDisclosure&gt;**](AirbnbSafetyDisclosure.md) | Guest-safety disclosures — exterior cameras, noise monitors, stairs, pets, an unfenced pool. FULL replacement of the canonical set: omit to leave untouched, send &#x60;[]&#x60; to clear. Canonical storage only — distributing them to Airbnb is &#x60;PUT /v1/channels/airbnb/listings/{id}/safety-disclosures&#x60;, which merges rather than replaces. | [optional] |

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
  allows_events: null,
  quiet_hours_start: 22:00,
  quiet_hours_end: 07:00,
  check_in_method: null,
  check_in_instruction: null,
  guest_safety_disclosures: null
)
```

