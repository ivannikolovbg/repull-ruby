# Repull::GetVrboListingBookingSettings200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **vrbo_listing_number** | **String** |  |  |
| **property_id** | **String** | Vrbo&#39;s property id for the unit. |  |
| **section** | **String** |  |  |
| **data** | [**GetVrboListingBookingSettings200ResponseData**](GetVrboListingBookingSettings200ResponseData.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingBookingSettings200Response.new(
  listing_id: null,
  vrbo_listing_number: null,
  property_id: null,
  section: booking-settings,
  data: null
)
```

