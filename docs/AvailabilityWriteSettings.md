# Repull::AvailabilityWriteSettings

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **available** | **Boolean** | Block or unblock the dates. | [optional] |
| **price** | **Float** | Nightly base price. | [optional] |
| **min_nights** | **Integer** |  | [optional] |
| **max_nights** | **Integer** |  | [optional] |
| **available_units** | **Integer** | Rooms to sell on these dates, for a listing that sells several identical rooms (&#x60;unitCount&#x60; &gt; 1, e.g. a Booking.com room type). Up to the listing&#39;s &#x60;unitCount&#x60;. Refused with &#x60;409 managed_by_pms&#x60; on a hotel PMS room type (Cloudbeds, Mews) — its PMS owns the room count. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AvailabilityWriteSettings.new(
  available: null,
  price: null,
  min_nights: null,
  max_nights: null,
  available_units: null
)
```

