# Repull::AirbnbReservationActionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** |  |  |
| **reason** | **String** | Required for &#x60;decline&#x60; and &#x60;cancel&#x60;; not accepted for &#x60;accept&#x60;. &#x60;decline&#x60; takes &#x60;dates_not_available&#x60;, &#x60;not_comfortable&#x60;, &#x60;listing_not_ready&#x60;, &#x60;different_dates_needed&#x60;, &#x60;spam&#x60; or &#x60;other&#x60;. &#x60;cancel&#x60; takes &#x60;calendar_conflict&#x60;, &#x60;maintenance_issue&#x60;, &#x60;unable_to_host&#x60; or &#x60;other&#x60;. | [optional] |
| **message** | **String** | Required for &#x60;decline&#x60; only: sent to the guest by Airbnb. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbReservationActionRequest.new(
  action: null,
  reason: null,
  message: null
)
```

