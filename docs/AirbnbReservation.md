# Repull::AirbnbReservation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confirmation_code** | **String** |  | [optional] |
| **listing_id** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **guest_name** | **String** |  | [optional] |
| **guest_count** | **Integer** |  | [optional] |
| **total_price** | **Float** |  | [optional] |
| **currency** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbReservation.new(
  confirmation_code: HMABC12345,
  listing_id: null,
  status: accepted,
  check_in: null,
  check_out: null,
  guest_name: null,
  guest_count: null,
  total_price: null,
  currency: null
)
```

