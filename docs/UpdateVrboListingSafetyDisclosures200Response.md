# Repull::UpdateVrboListingSafetyDisclosures200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**UpdateVrboListingSafetyDisclosures200ResponseData**](UpdateVrboListingSafetyDisclosures200ResponseData.md) |  |  |
| **written** | **Array&lt;String&gt;** | The fields this request sent. |  |
| **data_freshness** | [**GetVrboListingAdditionalInfo200ResponseDataFreshness**](GetVrboListingAdditionalInfo200ResponseDataFreshness.md) |  |  |
| **vrbo_listing_number** | **String** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingSafetyDisclosures200Response.new(
  data: null,
  written: null,
  data_freshness: null,
  vrbo_listing_number: null
)
```

