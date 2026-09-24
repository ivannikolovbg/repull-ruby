# Repull::ListingContentUpdateRequestRoomsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_type** | **String** | e.g. &#x60;bedroom&#x60;, &#x60;full_bathroom&#x60;, &#x60;half_bathroom&#x60;, &#x60;living_room&#x60;, &#x60;kitchen&#x60;. Not a closed list — Airbnb validates it at publish and its refusal comes back in the publish result. |  |
| **room_name** | **String** | Your own label, e.g. \&quot;Primary bedroom\&quot;. | [optional] |
| **room_number** | **Integer** | Order among rooms of the same type, from 1. | [optional] |
| **is_private** | **Boolean** | Whether the room is private to the guest. | [optional] |
| **beds** | [**Array&lt;ListingContentUpdateRequestRoomsInnerBedsInner&gt;**](ListingContentUpdateRequestRoomsInnerBedsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateRequestRoomsInner.new(
  room_type: bedroom,
  room_name: null,
  room_number: null,
  is_private: null,
  beds: null
)
```

