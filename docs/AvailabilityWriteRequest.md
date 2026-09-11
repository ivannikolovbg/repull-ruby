# Repull::AvailabilityWriteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **available** | **Boolean** | Block or unblock the dates. | [optional] |
| **price** | **Float** | Nightly base price. | [optional] |
| **min_nights** | **Integer** |  | [optional] |
| **max_nights** | **Integer** |  | [optional] |
| **dates** | **Array&lt;Date&gt;** | ISO dates. Capped at 731 — Airbnb refuses calendar writes spanning more. |  |

## Example

```ruby
require 'repull'

instance = Repull::AvailabilityWriteRequest.new(
  available: null,
  price: null,
  min_nights: null,
  max_nights: null,
  dates: null
)
```

