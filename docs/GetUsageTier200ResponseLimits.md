# Repull::GetUsageTier200ResponseLimits

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **monthly_requests** | **Integer** |  | [optional] |
| **daily_ai_requests** | **Integer** |  | [optional] |
| **dynamic_pricing_listings** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetUsageTier200ResponseLimits.new(
  monthly_requests: null,
  daily_ai_requests: null,
  dynamic_pricing_listings: null
)
```

