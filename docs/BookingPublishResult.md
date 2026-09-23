# Repull::BookingPublishResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **published** | **Boolean** | True only when EVERY attempted section reached Booking.com. |  |
| **sections** | **Array&lt;String&gt;** | Sections that landed on Booking.com. |  |
| **errors** | [**Array&lt;BookingPublishSectionError&gt;**](BookingPublishSectionError.md) | Per-section failures. Empty when &#x60;published&#x60; is true. |  |
| **reason** | **String** | Set when the publish never started at all — most often because the listing is not mapped to any Booking.com property yet. Finish the Connect flow (&#x60;POST /v1/connect/booking/map-rooms&#x60;) and publish again. | [optional] |
| **hotel_id** | **String** | The Booking.com property this publish wrote into — resolved from the listing&#39;s mapping, or the one you named. Always read it back: a listing can be mapped to several properties, and this states which one actually received the content. Null when the listing is mapped to no property, in which case nothing was pushed. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingPublishResult.new(
  published: null,
  sections: [&quot;details&quot;,&quot;description&quot;,&quot;photos&quot;],
  errors: null,
  reason: null,
  hotel_id: null
)
```

