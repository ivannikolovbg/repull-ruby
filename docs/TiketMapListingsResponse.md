# Repull::TiketMapListingsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** |  | [optional] |
| **results** | [**Array&lt;TiketMapListingsResponseResultsInner&gt;**](TiketMapListingsResponseResultsInner.md) | One entry per mapping. | [optional] |
| **replayed_reservations** | **Integer** | Bookings tiket.com delivered while the room was unmapped, now recorded on the listing. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketMapListingsResponse.new(
  property_id: null,
  results: null,
  replayed_reservations: null
)
```

