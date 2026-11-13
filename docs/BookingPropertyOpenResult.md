# Repull::BookingPropertyOpenResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | The Booking.com property (hotel id). |  |
| **listing_ids** | **Array&lt;String&gt;** | The listings in this request that are mapped to the property. |  |
| **outcome** | **String** | &#x60;opened&#x60;: Booking.com&#39;s check passed and the property is now open. &#x60;refused&#x60;: Booking.com&#39;s check did not pass — &#x60;blockers&#x60; has its own reasons — and nothing changed. &#x60;not_needed&#x60;: Booking.com already has the property past its build stage (open, or closed by you), so it was left alone; use the &#x60;open&#x60; action on &#x60;POST /v1/channels/booking/properties/{id}&#x60; to reopen a closed property. &#x60;listing_inactive&#x60;: another listing on the same property is still inactive. &#x60;no_listing&#x60;: no listing is mapped to the property. &#x60;failed&#x60;: Booking.com did not answer; nothing changed — send the request again. |  |
| **booking_status** | **String** | Booking.com&#39;s status for the property before anything was sent, e.g. &#x60;XML: Ready to open&#x60;, when it was read. |  |
| **blockers** | **Array&lt;String&gt;** | Booking.com&#39;s own reasons it will not open the property, e.g. \&quot;Room 1554900501 does not have kitchen or kitchenette\&quot;. Empty unless &#x60;outcome&#x60; is &#x60;refused&#x60;. |  |

## Example

```ruby
require 'repull'

instance = Repull::BookingPropertyOpenResult.new(
  hotel_id: null,
  listing_ids: null,
  outcome: null,
  booking_status: null,
  blockers: null
)
```

