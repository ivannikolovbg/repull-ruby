# Repull::GetVrboListingRooms200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**GetVrboListingRooms200ResponseData**](GetVrboListingRooms200ResponseData.md) |  |  |
| **data_freshness** | [**GetVrboListingAdditionalInfo200ResponseDataFreshness**](GetVrboListingAdditionalInfo200ResponseDataFreshness.md) |  |  |
| **vrbo_listing_number** | **String** | The Vrbo listing number this is about. |  |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingRooms200Response.new(
  data: null,
  data_freshness: null,
  vrbo_listing_number: null
)
```

