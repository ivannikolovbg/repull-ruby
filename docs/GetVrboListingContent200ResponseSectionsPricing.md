# Repull::GetVrboListingContent200ResponseSectionsPricing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **currency** | **String** |  | [optional] |
| **nightly_rate** | **Hash&lt;String, Object&gt;** | Base rate per weekday (sunday … saturday). | [optional] |
| **weekly_discount_percent** | **Float** |  | [optional] |
| **monthly_discount_percent** | **Float** |  | [optional] |
| **default_min_stay** | **Integer** |  | [optional] |
| **rate_limits** | **Object** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingContent200ResponseSectionsPricing.new(
  currency: null,
  nightly_rate: null,
  weekly_discount_percent: null,
  monthly_discount_percent: null,
  default_min_stay: null,
  rate_limits: null
)
```

