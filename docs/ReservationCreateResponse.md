# Repull::ReservationCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Pass to &#x60;GET /v1/reservations/{id}&#x60; for the full record. | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **platform** | **String** |  | [optional] |
| **status** | **String** | Same vocabulary as &#x60;GET /v1/reservations/{id}&#x60;. | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **guest_id** | **Integer** |  | [optional] |
| **total_price** | **Float** | The price the pricing engine derived for the stay. Reservations created through this endpoint are NOT priced from the request — see the operation description. On a Mews or Cloudbeds listing, the PMS prices it from its own rate. | [optional] |
| **currency** | **String** |  | [optional] |
| **unit** | [**ReservationCreateResponseUnit**](ReservationCreateResponseUnit.md) |  | [optional] |
| **pms** | [**ReservationCreateResponsePms**](ReservationCreateResponsePms.md) |  | [optional] |

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
  guest_id: null,
  total_price: null,
  currency: null,
  unit: null,
  pms: null
)
```

