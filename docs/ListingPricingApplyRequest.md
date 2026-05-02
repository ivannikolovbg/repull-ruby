# Repull::ListingPricingApplyRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dates** | **Array&lt;Date&gt;** | Dates the action applies to. Must match dates that have a &#x60;pending&#x60; recommendation; others are silently skipped. |  |
| **action** | **String** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingPricingApplyRequest.new(
  dates: null,
  action: null
)
```

