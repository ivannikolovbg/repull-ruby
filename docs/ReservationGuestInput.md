# Repull::ReservationGuestInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first_name** | **String** |  |  |
| **last_name** | **String** |  | [optional] |
| **email** | **String** |  | [optional] |
| **phone** | **String** | E.164 preferred. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationGuestInput.new(
  first_name: Ada,
  last_name: Lovelace,
  email: ada@example.com,
  phone: +14035551234
)
```

