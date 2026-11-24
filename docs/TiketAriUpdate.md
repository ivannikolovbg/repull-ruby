# Repull::TiketAriUpdate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_type_code** | **String** | tiket.com room type id. Required on &#x60;PUT /v1/channels/tiket/availability&#x60;; on the listing route it is always the listing&#39;s room. | [optional] |
| **rate_plan_code** | **String** | tiket.com rate plan id. Required for &#x60;rates&#x60; and &#x60;restrictions&#x60; on &#x60;PUT /v1/channels/tiket/availability&#x60;; on the listing route it defaults to every rate plan of the room selected for pushes. | [optional] |
| **start** | **Date** | First night. tiket.com accepts today up to 500 days ahead. |  |
| **_end** | **Date** | Last night, inclusive. |  |
| **available_rooms** | **Integer** | &#x60;availability&#x60;: rooms to sell. | [optional] |
| **price** | **Float** | &#x60;rates&#x60; on a Room Based property: price per night, tax included. Greater than 0. | [optional] |
| **occupancy_prices** | [**Array&lt;TiketOccupancyPrice&gt;**](TiketOccupancyPrice.md) | &#x60;rates&#x60; on an Occupancy Based property. Send &#x60;price&#x60; or &#x60;occupancyPrices&#x60;, not both. | [optional] |
| **child_prices** | [**Array&lt;TiketChildPrice&gt;**](TiketChildPrice.md) | Children prices. **Children rates are paused.** tiket.com has asked every channel manager not to send children rates until it fixes an issue on its side, so a write that includes &#x60;childPrices&#x60; is refused with &#x60;422 invalid_params&#x60; and nothing is sent. Children rates set in the tiket.com extranet still apply. Send &#x60;price&#x60; or &#x60;occupancyPrices&#x60; without &#x60;childPrices&#x60;. | [optional] |
| **currency** | **String** | ISO 4217. Defaults to the property currency. | [optional] |
| **min_stay** | **Integer** | &#x60;restrictions&#x60;: minimum nights. | [optional] |
| **max_stay** | **Integer** | &#x60;restrictions&#x60;: maximum nights. | [optional] |
| **stop_sell** | **Boolean** | &#x60;restrictions&#x60;: close (&#x60;true&#x60;) or open (&#x60;false&#x60;) the rate plan. With &#x60;availability&#x60; and a &#x60;ratePlanCode&#x60;, also closes that rate plan. | [optional] |
| **closed_to_arrival** | **Boolean** | &#x60;restrictions&#x60;. | [optional] |
| **closed_to_departure** | **Boolean** | &#x60;restrictions&#x60;. | [optional] |
| **min_advance_days** | **Integer** | &#x60;restrictions&#x60;: minimum days between booking and arrival. | [optional] |
| **max_advance_days** | **Integer** | &#x60;restrictions&#x60;: maximum days between booking and arrival. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketAriUpdate.new(
  room_type_code: null,
  rate_plan_code: null,
  start: null,
  _end: null,
  available_rooms: null,
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

