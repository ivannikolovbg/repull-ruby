# Repull::UpdateVrboListingRoomRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **description** | **String** | Vrbo cannot clear a room description once set. | [optional] |
| **sub_type** | **String** | Bathrooms: FULL_BATH (default) or NO_TUB_OR_SHOWER (half bath). | [optional] |
| **beds** | [**Array&lt;UpdateVrboListingRoomRequestBedsInner&gt;**](UpdateVrboListingRoomRequestBedsInner.md) | The room&#39;s whole sleeping arrangement: every bed, not just the changed one. | [optional] |
| **amenities** | [**UpdateVrboListingRoomRequestAmenities**](UpdateVrboListingRoomRequestAmenities.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingRoomRequest.new(
  name: null,
  description: null,
  sub_type: FULL_BATH,
  beds: null,
  amenities: null
)
```

