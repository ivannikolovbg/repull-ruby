# Repull::UpdateReservationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **status** | **String** |  | [optional] |
| **total_price** | **Float** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateReservationRequest.new(
  check_in: null,
  check_out: null,
  status: null,
  total_price: null
)
```

