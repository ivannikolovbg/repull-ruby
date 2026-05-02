# Repull::MarketCalendarResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **city** | **String** |  | [optional] |
| **date_range** | [**ListingPricingResponseDateRange**](ListingPricingResponseDateRange.md) |  | [optional] |
| **days** | [**Array&lt;MarketCalendarDay&gt;**](MarketCalendarDay.md) |  | [optional] |
| **events** | [**Array&lt;MarketEvent&gt;**](MarketEvent.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketCalendarResponse.new(
  city: null,
  date_range: null,
  days: null,
  events: null
)
```

