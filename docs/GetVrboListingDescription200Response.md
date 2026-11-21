# Repull::GetVrboListingDescription200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **vrbo_listing_number** | **String** |  |  |
| **property_id** | **String** | Vrbo&#39;s property id for the unit. |  |
| **section** | **String** |  |  |
| **data** | [**GetVrboListingDescription200ResponseData**](GetVrboListingDescription200ResponseData.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingDescription200Response.new(
  listing_id: null,
  vrbo_listing_number: null,
  property_id: null,
  section: description,
  data: null
)
```

