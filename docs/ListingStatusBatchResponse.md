# Repull::ListingStatusBatchResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **active** | **Boolean** | The state every listing in the request is now in. |  |
| **updated** | **Array&lt;String&gt;** | Listing ids whose state this call changed, in request order. |  |
| **unchanged** | **Array&lt;String&gt;** | Listing ids that were already in the requested state, in request order. |  |
| **booking_properties** | [**Array&lt;BookingPropertyOpenResult&gt;**](BookingPropertyOpenResult.md) | Only when &#x60;active&#x60; is true: one entry per Booking.com property the listings in the request are mapped to, saying whether it was opened. Every listing in the request counts, including those in &#x60;unchanged&#x60;, so sending &#x60;active: true&#x60; again retries an open Booking.com refused. Empty when none of the listings has a Booking.com property. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingStatusBatchResponse.new(
  active: null,
  updated: null,
  unchanged: null,
  booking_properties: null
)
```

