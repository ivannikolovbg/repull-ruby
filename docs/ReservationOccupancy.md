# Repull::ReservationOccupancy

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **adults** | **Integer** |  | [optional] |
| **children** | **Integer** |  | [optional] |
| **infants** | **Integer** |  | [optional] |
| **pets** | **Integer** |  | [optional] |
| **total** | **Integer** | Total guests (sum across all categories as reported by the source channel). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationOccupancy.new(
  adults: null,
  children: null,
  infants: null,
  pets: null,
  total: null
)
```

