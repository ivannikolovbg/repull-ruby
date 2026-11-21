# Repull::UpdateVrboListingDescriptions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;GetVrboListingContent200ResponseSectionsDescriptionsInner&gt;**](GetVrboListingContent200ResponseSectionsDescriptionsInner.md) | What Vrbo has after the write, read back from Vrbo. |  |
| **written** | **Array&lt;String&gt;** | The fields this request sent. |  |
| **data_freshness** | [**GetVrboListingAdditionalInfo200ResponseDataFreshness**](GetVrboListingAdditionalInfo200ResponseDataFreshness.md) |  |  |
| **vrbo_listing_number** | **String** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingDescriptions200Response.new(
  data: null,
  written: null,
  data_freshness: null,
  vrbo_listing_number: null
)
```

