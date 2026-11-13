# Repull::MapConnectBookingRoomsResponsePropertyStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** |  | [optional] |
| **outcome** | **String** | &#x60;opened&#x60;: it was being built and is now open. &#x60;not_needed&#x60;: it was already past that stage. &#x60;blocked&#x60;: Booking.com will not open it yet — see &#x60;blockers&#x60;. &#x60;status_unknown&#x60;: its status could not be read. &#x60;failed&#x60;: Booking.com did not answer the open request. &#x60;listing_inactive&#x60;: a listing mapped to the property is inactive, so it was not opened — activate it when it is ready and Repull opens the property. &#x60;no_listing&#x60;: no listing is mapped to it. | [optional] |
| **status_before** | **String** | Booking.com&#39;s status for the property before this step, e.g. &#x60;XML: Being built&#x60;. | [optional] |
| **blockers** | **Array&lt;String&gt;** | Booking.com&#39;s own reasons it will not open the property yet. | [optional] |
| **message** | **String** | What is wrong and how to fix it, in plain words. Null when the property is open. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MapConnectBookingRoomsResponsePropertyStatus.new(
  property_id: null,
  outcome: null,
  status_before: null,
  blockers: null,
  message: null
)
```

