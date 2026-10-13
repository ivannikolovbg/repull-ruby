# Repull::GetHotel200ResponseRoomTypesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** | The room type&#39;s listing id — use it with every /v1/listings, /v1/availability and /v1/reservations endpoint. | [optional] |
| **name** | **String** |  | [optional] |
| **unit_count** | **Integer** | Rooms of this type. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetHotel200ResponseRoomTypesInner.new(
  listing_id: null,
  name: null,
  unit_count: null
)
```

