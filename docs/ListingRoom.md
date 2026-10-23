# Repull::ListingRoom

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Room kind, Airbnb spelling: &#x60;bedroom&#x60;, &#x60;living_room&#x60;, &#x60;full_bathroom&#x60;, &#x60;kitchen&#x60;, … | [optional] |
| **name** | **String** |  | [optional] |
| **number** | **Integer** | Position among rooms of the same type (bedroom 1, 2, …). | [optional] |
| **is_private** | **Boolean** |  | [optional] |
| **beds** | [**Array&lt;ListingRoomBedsInner&gt;**](ListingRoomBedsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingRoom.new(
  type: bedroom,
  name: null,
  number: null,
  is_private: null,
  beds: null
)
```

