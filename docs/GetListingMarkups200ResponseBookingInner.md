# Repull::GetListingMarkups200ResponseBookingInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | Booking.com property id. | [optional] |
| **markup_percent** | **Float** | Percent added on Booking.com, for every listing on this property. | [optional] |
| **listing_ids** | **Array&lt;String&gt;** | Listings in this workspace priced through this property — all share this markup. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetListingMarkups200ResponseBookingInner.new(
  hotel_id: null,
  markup_percent: 18,
  listing_ids: null
)
```

