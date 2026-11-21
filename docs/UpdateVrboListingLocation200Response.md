# Repull::UpdateVrboListingLocation200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **vrbo_listing_number** | **String** |  |  |
| **property_id** | **String** | Vrbo&#39;s property id for the unit. |  |
| **section** | **String** |  |  |
| **written** | **Array&lt;String&gt;** | The fields this request sent. |  |
| **data** | [**UpdateVrboListingLocation200ResponseData**](UpdateVrboListingLocation200ResponseData.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingLocation200Response.new(
  listing_id: null,
  vrbo_listing_number: null,
  property_id: null,
  section: location,
  written: null,
  data: null
)
```

