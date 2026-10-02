# Repull::ReservationCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Pass to &#x60;GET /v1/reservations/{id}&#x60; for the full record. A string, like every id in API responses. | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **platform** | **String** |  | [optional] |
| **status** | **String** | Same vocabulary as &#x60;GET /v1/reservations/{id}&#x60;. | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **guest_id** | **String** |  | [optional] |
| **total_price** | **Float** | The total the booking was recorded at. On a PMS listing: the PMS&#39;s total (your &#x60;totalPrice&#x60; where the PMS honours one, else the PMS&#39;s own price). On any other listing: the price the rate engine derived (&#x60;0&#x60; when the listing has no rates for the range). | [optional] |
| **currency** | **String** |  | [optional] |
| **unit** | [**ReservationCreateResponseUnit**](ReservationCreateResponseUnit.md) |  | [optional] |
| **pms** | [**ReservationPmsOutcome**](ReservationPmsOutcome.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCreateResponse.new(
  id: 215708,
  confirmation_code: DIR-8H2K4N,
  listing_id: 4118,
  platform: direct,
  status: confirmed,
  check_in: null,
  check_out: null,
  guest_id: 91234,
  total_price: null,
  currency: null,
  unit: null,
  pms: null
)
```

