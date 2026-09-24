# Repull::MigrationReservationRef

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confirmation_code** | **String** |  | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **reservation_id** | **String** |  | [optional] |
| **platform** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationReservationRef.new(
  confirmation_code: null,
  check_in: null,
  check_out: null,
  reservation_id: null,
  platform: null
)
```

