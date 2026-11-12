# Repull::SetListingMarkupRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  |  |
| **markup_percent** | **Float** | 15 &#x3D; +15%. &#x60;null&#x60; removes the markup. |  |
| **hotel_id** | **String** | Booking.com property — required when the listing is on more than one. | [optional] |
| **account_id** | **String** | Vrbo account (&#x60;vrbo:7001234&#x60;, Vrbo&#39;s own account id) — required when the listing is linked on more than one. The old sign-in ids (&#x60;vrbo:13&#x60;) still resolve until 2027-02-12. | [optional] |

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

