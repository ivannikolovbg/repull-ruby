# Repull::ReservationUnit

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The room id, as listed by &#x60;GET /v1/listings/{id}/units&#x60;. | [optional] |
| **name** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationUnit.new(
  id: null,
  name: 101
)
```

