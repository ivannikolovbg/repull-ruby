# Repull::ReservationCreatedPayloadPrimaryGuest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first_name** | **String** |  | [optional] |
| **last_name** | **String** |  | [optional] |
| **email** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCreatedPayloadPrimaryGuest.new(
  first_name: Alex,
  last_name: Morgan,
  email: alex@example.com
)
```

