# Repull::TiketAriMismatch

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** |  | [optional] |
| **room_type_code** | **String** |  | [optional] |
| **rate_plan_code** | **String** |  | [optional] |
| **field** | **String** |  | [optional] |
| **sent** | **Object** | The value sent. | [optional] |
| **read** | **Object** | The value tiket.com returned. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketAriMismatch.new(
  date: null,
  room_type_code: null,
  rate_plan_code: null,
  field: price,
  sent: null,
  read: null
)
```

