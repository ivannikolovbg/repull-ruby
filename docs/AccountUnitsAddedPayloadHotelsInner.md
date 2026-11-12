# Repull::AccountUnitsAddedPayloadHotelsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **hotel_id** | **String** | Booking.com property ID. |  |
| **name** | **String** |  |  |
| **is_new** | **Boolean** | &#x60;true&#x60; when the login had no unit on this property before; &#x60;false&#x60; when rooms were added to a property it already had. |  |

## Example

```ruby
require 'repull'

instance = Repull::AccountUnitsAddedPayloadHotelsInner.new(
  hotel_id: null,
  name: null,
  is_new: null
)
```

