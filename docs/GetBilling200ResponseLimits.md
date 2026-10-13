# Repull::GetBilling200ResponseLimits

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **monthly_requests** | **Integer** | null &#x3D; no limit | [optional] |
| **daily_requests** | **Integer** | null &#x3D; no limit | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetBilling200ResponseLimits.new(
  monthly_requests: null,
  daily_requests: null
)
```

