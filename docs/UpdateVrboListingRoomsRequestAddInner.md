# Repull::UpdateVrboListingRoomsRequestAddInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | One of the read&#39;s &#x60;addableTypes&#x60; (BEDROOM, BATHROOM, LIVING_ROOM, OFFICE, …). |  |
| **name** | **String** |  | [optional] |
| **sub_type** | **String** | Bathrooms: one of the read&#39;s &#x60;bathroomTypes&#x60; (FULL_BATH, HALF_BATH, …). | [optional] |
| **description** | **String** |  | [optional] |
| **beds** | [**Array&lt;GetVrboListingContent200ResponseSectionsRoomsSpacesInnerBedsInner&gt;**](GetVrboListingContent200ResponseSectionsRoomsSpacesInnerBedsInner.md) |  | [optional] |
| **amenities** | [**UpdateVrboListingRoomsRequestAddInnerAmenities**](UpdateVrboListingRoomsRequestAddInnerAmenities.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingRoomsRequestAddInner.new(
  type: BEDROOM,
  name: null,
  sub_type: null,
  description: null,
  beds: null,
  amenities: null
)
```

