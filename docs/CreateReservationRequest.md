# Repull::CreateReservationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **Integer** |  |  |
| **check_in** | **Date** |  |  |
| **check_out** | **Date** |  |  |
| **guest_first_name** | **String** |  |  |
| **guest_last_name** | **String** |  |  |
| **guest_email** | **String** |  | [optional] |
| **guest_phone** | **String** |  | [optional] |
| **guest_count** | **Integer** |  | [optional] |
| **total_price** | **Float** |  | [optional] |
| **currency** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateReservationRequest.new(
  property_id: null,
  check_in: null,
  check_out: null,
  guest_first_name: null,
  guest_last_name: null,
  guest_email: null,
  guest_phone: null,
  guest_count: null,
  total_price: null,
  currency: null
)
```

