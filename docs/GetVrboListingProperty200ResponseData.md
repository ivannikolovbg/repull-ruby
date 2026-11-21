# Repull::GetVrboListingProperty200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_type** | **String** |  | [optional] |
| **property_type_options** | [**Array&lt;GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerOptionsInner&gt;**](GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerOptionsInner.md) |  | [optional] |
| **property_name** | **String** |  | [optional] |
| **interior_size** | [**GetVrboListingContent200ResponseSectionsPropertyInteriorSize**](GetVrboListingContent200ResponseSectionsPropertyInteriorSize.md) |  | [optional] |
| **seniors_only** | **Boolean** |  | [optional] |
| **long_term_renters_welcome** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingProperty200ResponseData.new(
  property_type: townhome,
  property_type_options: null,
  property_name: null,
  interior_size: null,
  seniors_only: null,
  long_term_renters_welcome: null
)
```

