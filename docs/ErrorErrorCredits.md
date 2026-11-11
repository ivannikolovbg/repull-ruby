# Repull::ErrorErrorCredits

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **usd_per_1000_requests** | **Float** |  |  |
| **top_up_url** | **String** |  |  |
| **balance_usd** | **Float** | Your wallet balance; null when you have no wallet. |  |

## Example

```ruby
require 'repull'

instance = Repull::ErrorErrorCredits.new(
  usd_per_1000_requests: 1,
  top_up_url: https://repull.dev/dashboard/billing,
  balance_usd: null
)
```

