# Repull::BookingPricingUpdateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **pushed** | **Integer** | Number of updates Booking.com accepted as &#x60;success&#x60;. Falls back to total update count when Booking omits per-update status on full success. | [optional] |
| **requested** | **Integer** |  | [optional] |
| **errors** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | Per-update failure rows from Booking — shape mirrors the Booking rates API response. | [optional] |
| **raw** | **Hash&lt;String, Object&gt;** | Verbatim Booking response envelope for debugging. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPricingUpdateResponse.new(
  hotel_id: null,
  listing_id: null,
  pushed: null,
  requested: null,
  errors: null,
  raw: null
)
```

