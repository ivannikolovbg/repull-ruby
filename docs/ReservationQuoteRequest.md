# Repull::ReservationQuoteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** |  |  |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** | Must be after &#x60;checkIn&#x60;. |  |
| **adults** | **Integer** |  | [optional] |
| **children** | **Integer** |  | [optional] |
| **guest_count** | **Integer** | Total guests, when you do not split adults and children. | [optional] |
| **unit_id** | **String** | Quote one unit (&#x60;GET /v1/listings/{id}&#x60; → &#x60;units[].id&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationQuoteRequest.new(
  listing_id: 4118,
  check_in: Thu Oct 01 00:00:00 UTC 2026,
  check_out: Mon Oct 05 00:00:00 UTC 2026,
  adults: 2,
  children: 1,
  guest_count: 3,
  unit_id: 3f1c9a20
)
```

