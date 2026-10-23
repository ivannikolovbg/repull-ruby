# Repull::ListingRules

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **min_nights** | **Integer** |  | [optional] |
| **max_nights** | **Integer** |  | [optional] |
| **booking_window_days** | **Integer** | How far ahead a guest can book. &#x60;null&#x60; when unlimited or not set. | [optional] |
| **advance_notice_hours** | **Integer** | Hours of notice required before check-in. | [optional] |
| **preparation_days** | **Integer** | Nights blocked between stays. | [optional] |
| **allows_booking_requests** | **Boolean** | Whether guests may send a booking request inside the notice window. | [optional] |
| **instant_book** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingRules.new(
  min_nights: null,
  max_nights: null,
  booking_window_days: null,
  advance_notice_hours: null,
  preparation_days: null,
  allows_booking_requests: null,
  instant_book: null
)
```

