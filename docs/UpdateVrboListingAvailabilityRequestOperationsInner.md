# Repull::UpdateVrboListingAvailabilityRequestOperationsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** |  | [optional] |
| **end_date** | **Date** |  | [optional] |
| **dates** | **Array&lt;String&gt;** | &#x60;YYYY-MM-DD&#x60;, or ranges as &#x60;YYYY-MM-DD:YYYY-MM-DD&#x60;. | [optional] |
| **daily_price** | **Float** | The nightly price on Vrbo, in the listing&#39;s Vrbo currency (sent as is — no markup). | [optional] |
| **availability** | **String** | &#x60;unavailable&#x60; blocks the nights on Vrbo; &#x60;available&#x60; opens them (never a night a booking holds). | [optional] |
| **min_nights** | **Integer** |  | [optional] |
| **closed_to_arrival** | **Boolean** | No check-in on these nights. | [optional] |
| **closed_to_departure** | **Boolean** | No check-out on these nights. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingAvailabilityRequestOperationsInner.new(
  start_date: null,
  end_date: null,
  dates: null,
  daily_price: null,
  availability: null,
  min_nights: null,
  closed_to_arrival: null,
  closed_to_departure: null
)
```

