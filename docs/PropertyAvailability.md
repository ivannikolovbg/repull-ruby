# Repull::PropertyAvailability

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | Repull property id (equal to &#x60;listings.id&#x60;), emitted as a string like every other id in the API. |  |
| **currency** | **String** | ISO 4217 currency code for the nightly prices in &#x60;days&#x60;. |  |
| **days** | [**Array&lt;PropertyAvailabilityDay&gt;**](PropertyAvailabilityDay.md) | Per-date calendar for the requested window (capped at 366 days), ordered ascending by date. Contains only dates we hold data for — it may be shorter than the window, or empty. |  |
| **coverage** | [**PropertyAvailabilityCoverage**](PropertyAvailabilityCoverage.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::PropertyAvailability.new(
  property_id: 4118,
  currency: USD,
  days: null,
  coverage: null
)
```

