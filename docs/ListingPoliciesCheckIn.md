# Repull::ListingPoliciesCheckIn

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **method** | **String** | &#x60;lockbox&#x60;, &#x60;smartlock&#x60;, &#x60;keypad&#x60;, &#x60;doorman&#x60;, &#x60;host_greets&#x60;, &#x60;building_staff&#x60;, &#x60;other&#x60;. | [optional] |
| **instructions** | **String** |  | [optional] |
| **from** | **String** |  | [optional] |
| **_until** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPoliciesCheckIn.new(
  method: lockbox,
  instructions: null,
  from: 15:00,
  _until: 22:00
)
```

