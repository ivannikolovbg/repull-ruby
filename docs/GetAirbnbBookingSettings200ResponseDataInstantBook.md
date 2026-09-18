# Repull::GetAirbnbBookingSettings200ResponseDataInstantBook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enabled** | **Boolean** | &#x60;false&#x60; when the category is &#x60;off&#x60; — the listing is request-to-book. | [optional] |
| **guest_category** | **String** | Which guests may Instant Book. | [optional] |
| **requires_good_track_record** | **Boolean** | &#x60;true&#x60; for &#x60;experienced_guests_only&#x60; / &#x60;recommended_guests_only&#x60; — Airbnb calls this a good track record. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbBookingSettings200ResponseDataInstantBook.new(
  enabled: null,
  guest_category: null,
  requires_good_track_record: null
)
```

