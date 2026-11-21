# Repull::GetVrboListingProtection200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **vrbo_listing_number** | **String** |  |  |
| **property_id** | **String** | Vrbo&#39;s property id for the unit. |  |
| **section** | **String** |  |  |
| **data** | [**GetVrboListingProtection200ResponseData**](GetVrboListingProtection200ResponseData.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingProtection200Response.new(
  listing_id: null,
  vrbo_listing_number: null,
  property_id: null,
  section: protection,
  data: null
)
```

