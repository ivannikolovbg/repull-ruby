# Repull::TiketRoom

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** | Repull id of the room (used by the Connect mapping). | [optional] |
| **room_type_code** | **String** | tiket.com room type id. | [optional] |
| **name** | **String** |  | [optional] |
| **max_adults** | **Integer** |  | [optional] |
| **max_children** | **Integer** |  | [optional] |
| **units** | **Integer** | Rooms of this type at the property. | [optional] |
| **listing_id** | **String** | The mapped Repull listing, or &#x60;null&#x60; when the room is not mapped (or its listing is hidden by &#x60;?status&#x3D;&#x60;). | [optional] |
| **listing_hidden** | **Boolean** | &#x60;true&#x60; when the room is mapped to a listing that &#x60;?status&#x3D;&#x60; hides. | [optional] |
| **rate_plans** | [**Array&lt;TiketRatePlan&gt;**](TiketRatePlan.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketRoom.new(
  room_id: null,
  room_type_code: null,
  name: null,
  max_adults: null,
  max_children: null,
  units: null,
  listing_id: null,
  listing_hidden: null,
  rate_plans: null
)
```

