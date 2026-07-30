# Repull::AirbnbAvailabilityWriteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  |  |
| **operations** | [**Array&lt;AirbnbCalendarOperation&gt;**](AirbnbCalendarOperation.md) | Required when &#x60;type: \&quot;calendar\&quot;&#x60;. Batch of per-date restriction operations. | [optional] |
| **rules** | **Hash&lt;String, Object&gt;** | Required when &#x60;type: \&quot;rules\&quot;&#x60;. Airbnb availability-rules object — &#x60;default_min_nights&#x60;, &#x60;default_max_nights&#x60;, &#x60;booking_lead_time&#x60;, &#x60;turnover_days&#x60;, &#x60;day_of_week_min_nights&#x60;, &#x60;seasonal_min_nights&#x60;, etc. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbAvailabilityWriteRequest.new(
  type: null,
  operations: null,
  rules: null
)
```

