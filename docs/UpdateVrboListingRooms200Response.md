# Repull::UpdateVrboListingRooms200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **vrbo_listing_number** | **String** |  |  |
| **property_id** | **String** | Vrbo&#39;s property id for the unit. |  |
| **section** | **String** |  |  |
| **written** | **Array&lt;String&gt;** | The fields this request sent. |  |
| **data** | [**UpdateVrboListingRooms200ResponseData**](UpdateVrboListingRooms200ResponseData.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingRooms200Response.new(
  listing_id: null,
  vrbo_listing_number: null,
  property_id: null,
  section: rooms,
  written: null,
  data: null
)
```

