# Repull::GetVrboListingDescriptions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;GetVrboListingContent200ResponseSectionsDescriptionsInner&gt;**](GetVrboListingContent200ResponseSectionsDescriptionsInner.md) | The section as Vrbo has it. |  |
| **languages** | [**Array&lt;GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerOptionsInner&gt;**](GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerOptionsInner.md) | The languages a translation can be written in (&#x60;value&#x60; is the &#x60;locale&#x60;). | [optional] |
| **data_freshness** | [**GetVrboListingAdditionalInfo200ResponseDataFreshness**](GetVrboListingAdditionalInfo200ResponseDataFreshness.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number this is about. |  |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingDescriptions200Response.new(
  data: null,
  languages: null,
  data_freshness: null,
  vrbo_listing_number: null
)
```

