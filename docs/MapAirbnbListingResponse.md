# Repull::MapAirbnbListingResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Boolean** |  |  |
| **already_mapped** | **Boolean** | True when the Airbnb listing was already mapped to this listing (no-op). |  |
| **airbnb_id** | **String** |  |  |
| **listing_id** | **String** |  |  |
| **previous_listing_id** | **String** | The listing the Airbnb record pointed at before this call. Omitted on a no-op. | [optional] |
| **host_id** | **String** |  |  |
| **listing_airbnb_id** | **String** | Internal id of the &#x60;listings_airbnb&#x60; record. |  |
| **platform_link_id** | **String** | Internal id of the resulting &#x60;listing_platform_links&#x60; row. |  |

## Example

```ruby
require 'repull'

instance = Repull::MapAirbnbListingResponse.new(
  success: true,
  already_mapped: null,
  airbnb_id: null,
  listing_id: null,
  previous_listing_id: null,
  host_id: null,
  listing_airbnb_id: null,
  platform_link_id: null
)
```

