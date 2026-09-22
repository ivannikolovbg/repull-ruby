# Repull::DeclineReservationRequestRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reason** | **String** | Airbnb’s decline reason, verbatim. &#x60;dates_not_available&#x60; — the dates are taken; &#x60;not_comfortable&#x60; — you are not comfortable with the booking; &#x60;listing_not_ready&#x60; — the listing cannot be booked right now; &#x60;different_dates_needed&#x60; — you want different dates; &#x60;spam&#x60; — the request is spam; &#x60;other&#x60; — anything else (explain in &#x60;message&#x60;). |  |
| **message** | **String** | Sent to the guest by Airbnb with the decline. |  |

## Example

```ruby
require 'repull'

instance = Repull::DeclineReservationRequestRequest.new(
  reason: null,
  message: Sorry, those dates are no longer available.
)
```

