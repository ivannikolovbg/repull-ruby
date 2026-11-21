# Repull::UpdateVrboListingRooms200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unit_id** | **String** |  | [optional] |
| **spaces** | [**Array&lt;GetVrboListingContent200ResponseSectionsRoomsSpacesInner&gt;**](GetVrboListingContent200ResponseSectionsRoomsSpacesInner.md) |  | [optional] |
| **addable_types** | **Array&lt;String&gt;** |  | [optional] |
| **bed_types** | [**Array&lt;GetVrboListingContent200ResponseSectionsRoomsBedTypesInner&gt;**](GetVrboListingContent200ResponseSectionsRoomsBedTypesInner.md) |  | [optional] |
| **bathroom_types** | [**Array&lt;GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerOptionsInner&gt;**](GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerOptionsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingRooms200ResponseData.new(
  unit_id: null,
  spaces: null,
  addable_types: null,
  bed_types: null,
  bathroom_types: null
)
```

