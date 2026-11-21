# Repull::UpdateVrboListingRatesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** |  |  |
| **end_date** | **Date** | On or after &#x60;startDate&#x60;, at most 3 years later. |  |
| **nightly_rate** | **Float** | One price for every night in the range. | [optional] |
| **nightly_rates** | [**UpdateVrboListingRatesRequestNightlyRates**](UpdateVrboListingRatesRequestNightlyRates.md) |  | [optional] |
| **weekly_discount_percent** | **Float** | Stays of 7–27 nights. | [optional] |
| **monthly_discount_percent** | **Float** | Stays of 28 nights or more. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingRatesRequest.new(
  start_date: null,
  end_date: null,
  nightly_rate: null,
  nightly_rates: null,
  weekly_discount_percent: null,
  monthly_discount_percent: null
)
```

