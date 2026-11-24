# Repull::TiketAriDay

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** |  |  |
| **room_type_code** | **String** | tiket.com room type id. |  |
| **rate_plan_code** | **String** | tiket.com rate plan id. &#x60;null&#x60; on a room type with no rate plan selected. |  |
| **available** | **Integer** | Rooms to sell. | [optional] |
| **booked** | **Integer** | Rooms tiket.com has sold for the night. | [optional] |
| **price** | **Float** | Room Based price per night, tax included. | [optional] |
| **occupancy_prices** | [**Array&lt;TiketOccupancyPrice&gt;**](TiketOccupancyPrice.md) | Occupancy Based prices. Empty on a Room Based property. | [optional] |
| **child_prices** | [**Array&lt;TiketChildPrice&gt;**](TiketChildPrice.md) | Children prices as tiket.com holds them (set in the extranet; see the note on children rates under &#x60;PUT /v1/channels/tiket/availability&#x60;). | [optional] |
| **currency** | **String** |  | [optional] |
| **min_stay** | **Integer** | Minimum nights. | [optional] |
| **max_stay** | **Integer** | Maximum nights. | [optional] |
| **stop_sell** | **Boolean** | &#x60;true&#x60; when the rate plan is closed for the night. | [optional] |
| **closed_to_arrival** | **Boolean** |  | [optional] |
| **closed_to_departure** | **Boolean** |  | [optional] |
| **min_advance_days** | **Integer** | Minimum days between booking and arrival. | [optional] |
| **max_advance_days** | **Integer** | Maximum days between booking and arrival. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketAriDay.new(
  date: Thu Dec 24 00:00:00 UTC 2026,
  room_type_code: null,
  rate_plan_code: null,
  available: null,
  booked: null,
  price: null,
  occupancy_prices: null,
  child_prices: null,
  currency: IDR,
  min_stay: null,
  max_stay: null,
  stop_sell: null,
  closed_to_arrival: null,
  closed_to_departure: null,
  min_advance_days: null,
  max_advance_days: null
)
```

