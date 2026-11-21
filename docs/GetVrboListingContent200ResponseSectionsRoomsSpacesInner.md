# Repull::GetVrboListingContent200ResponseSectionsRoomsSpacesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **space_id** | **String** |  | [optional] |
| **type** | **String** |  | [optional] |
| **sub_type** | **String** |  | [optional] |
| **name** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **is_legacy_common_area** | **Boolean** |  | [optional] |
| **beds** | [**Array&lt;GetVrboListingContent200ResponseSectionsRoomsSpacesInnerBedsInner&gt;**](GetVrboListingContent200ResponseSectionsRoomsSpacesInnerBedsInner.md) |  | [optional] |
| **amenities** | [**Array&lt;GetVrboListingContent200ResponseSectionsRoomsSpacesInnerAmenitiesInner&gt;**](GetVrboListingContent200ResponseSectionsRoomsSpacesInnerAmenitiesInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingContent200ResponseSectionsRoomsSpacesInner.new(
  space_id: null,
  type: BEDROOM,
  sub_type: FULL_BATH,
  name: null,
  description: null,
  is_legacy_common_area: null,
  beds: null,
  amenities: null
)
```

