# Repull::ReservationUpdatedEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **type** | **String** |  |  |
| **created_at** | **Time** |  | [optional] |
| **api_version** | **String** |  | [optional] |
| **data** | [**ReservationUpdatedPayload**](ReservationUpdatedPayload.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ReservationUpdatedEvent.new(
  id: null,
  type: null,
  created_at: null,
  api_version: null,
  data: null
)
```

