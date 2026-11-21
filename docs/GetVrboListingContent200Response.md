# Repull::GetVrboListingContent200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **vrbo_listing_number** | **String** |  |  |
| **property_id** | **String** |  |  |
| **listing** | [**GetVrboListingContent200ResponseListing**](GetVrboListingContent200ResponseListing.md) |  | [optional] |
| **sections** | [**GetVrboListingContent200ResponseSections**](GetVrboListingContent200ResponseSections.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingContent200Response.new(
  listing_id: null,
  vrbo_listing_number: null,
  property_id: null,
  listing: null,
  sections: null
)
```

