# Repull::ReservationCreatedPayloadGuests

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **adults** | **Integer** |  | [optional] |
| **children** | **Integer** |  | [optional] |
| **infants** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCreatedPayloadGuests.new(
  adults: 2,
  children: 0,
  infants: 0
)
```

