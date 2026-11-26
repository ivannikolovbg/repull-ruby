# Repull::SetListingMarkupRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  |  |
| **markup_percent** | **Float** | 15 &#x3D; +15%; -2 &#x3D; 2% below the listing&#39;s price. Above -100 and below 100. &#x60;null&#x60; removes the markup. |  |
| **hotel_id** | **String** | Booking.com property — required when the listing is on more than one. | [optional] |
| **account_id** | **String** | Ignored. The Vrbo markup is per listing, so there is no account to name; accepted so existing calls keep working. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SetListingMarkupRequest.new(
  channel: null,
  markup_percent: null,
  hotel_id: null,
  account_id: null
)
```

