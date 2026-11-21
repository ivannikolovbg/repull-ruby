# Repull::GetVrboListingRates200ResponseDataDaysInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** |  | [optional] |
| **weekday** | **String** |  | [optional] |
| **nightly_rate** | **Float** |  | [optional] |
| **weekly_discount_percent** | **Float** |  | [optional] |
| **monthly_discount_percent** | **Float** |  | [optional] |
| **min_stay** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingRates200ResponseDataDaysInner.new(
  date: null,
  weekday: friday,
  nightly_rate: null,
  weekly_discount_percent: null,
  monthly_discount_percent: null,
  min_stay: null
)
```

