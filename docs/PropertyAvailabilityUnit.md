# Repull::PropertyAvailabilityUnit

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The unit id: &#x60;units[].id&#x60; on the listing, &#x60;unit.id&#x60; on a reservation. |  |
| **available** | **Boolean** | Whether this unit is free that night. |  |

## Example

```ruby
require 'repull'

instance = Repull::PropertyAvailabilityUnit.new(
  id: unit_b,
  available: false
)
```

