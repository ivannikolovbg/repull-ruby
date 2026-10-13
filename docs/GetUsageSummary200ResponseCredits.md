# Repull::GetUsageSummary200ResponseCredits

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **balance_usd** | **Float** |  | [optional] |
| **active** | **Boolean** | Positive balance and not paused — usage beyond the monthly quota is being served. | [optional] |
| **paused** | **Boolean** |  | [optional] |
| **usd_per1000_requests** | **Float** |  | [optional] |
| **requests_covered** | **Integer** | Requests beyond your quota the current balance pays for. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetUsageSummary200ResponseCredits.new(
  balance_usd: null,
  active: null,
  paused: null,
  usd_per1000_requests: 1,
  requests_covered: null
)
```

