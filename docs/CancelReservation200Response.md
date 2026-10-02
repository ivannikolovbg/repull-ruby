# Repull::CancelReservation200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **updated_at** | **String** |  | [optional] |
| **already_cancelled** | **Boolean** | Present and true when the reservation was already cancelled. | [optional] |
| **pms** | [**ReservationPmsOutcome**](ReservationPmsOutcome.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CancelReservation200Response.new(
  id: null,
  confirmation_code: null,
  listing_id: null,
  status: null,
  check_in: null,
  check_out: null,
  updated_at: null,
  already_cancelled: null,
  pms: null
)
```

