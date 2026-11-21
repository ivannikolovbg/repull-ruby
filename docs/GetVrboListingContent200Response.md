# Repull::GetVrboListingContent200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sections** | [**GetVrboListingContent200ResponseSections**](GetVrboListingContent200ResponseSections.md) |  |  |
| **data_freshness** | [**GetVrboListingAdditionalInfo200ResponseDataFreshness**](GetVrboListingAdditionalInfo200ResponseDataFreshness.md) |  |  |
| **vrbo_listing_number** | **String** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingContent200Response.new(
  sections: null,
  data_freshness: null,
  vrbo_listing_number: null
)
```

