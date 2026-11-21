# Repull::GetVrboListingProtection200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**GetVrboListingProtection200ResponseData**](GetVrboListingProtection200ResponseData.md) |  |  |
| **data_freshness** | [**GetVrboListingAdditionalInfo200ResponseDataFreshness**](GetVrboListingAdditionalInfo200ResponseDataFreshness.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number this is about. |  |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingProtection200Response.new(
  data: null,
  data_freshness: null,
  vrbo_listing_number: null
)
```

