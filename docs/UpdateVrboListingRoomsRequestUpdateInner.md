# Repull::UpdateVrboListingRoomsRequestUpdateInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **space_id** | **String** |  |  |
| **name** | **String** |  | [optional] |
| **sub_type** | **String** | Bathrooms: one of the read&#39;s &#x60;bathroomTypes&#x60; (FULL_BATH, HALF_BATH, …). | [optional] |
| **description** | **String** |  | [optional] |
| **beds** | [**Array&lt;GetVrboListingContent200ResponseSectionsRoomsSpacesInnerBedsInner&gt;**](GetVrboListingContent200ResponseSectionsRoomsSpacesInnerBedsInner.md) |  | [optional] |
| **amenities** | [**UpdateVrboListingRoomsRequestAddInnerAmenities**](UpdateVrboListingRoomsRequestAddInnerAmenities.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingRoomsRequestUpdateInner.new(
  space_id: null,
  name: null,
  sub_type: null,
  description: null,
  beds: null,
  amenities: null
)
```

