# Repull::ReservationCreatedEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Stable event id — same across delivery retries of the same logical event. | [optional] |
| **type** | **String** |  |  |
| **created_at** | **Time** |  | [optional] |
| **api_version** | **String** |  | [optional] |
| **data** | [**ReservationCreatedPayload**](ReservationCreatedPayload.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCreatedEvent.new(
  id: null,
  type: null,
  created_at: null,
  api_version: 2026-04,
  data: null
)
```

