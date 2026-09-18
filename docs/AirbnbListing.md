# Repull::AirbnbListing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** | Vanio (Repull) listing id | [optional] |
| **name** | **String** | Listing title | [optional] |
| **city** | **String** |  | [optional] |
| **thumbnail_url** | **String** | Cover photo URL for the Vanio listing. **Only present when the caller passes &#x60;?include&#x3D;thumbnail&#x60;.** &#x60;null&#x60; when the listing has no cover photo stored — the listing is still returned. | [optional] |
| **connections** | [**Array&lt;AirbnbConnection&gt;**](AirbnbConnection.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbListing.new(
  listing_id: 6248,
  name: Oceanview Villa,
  city: Malibu,
  thumbnail_url: null,
  connections: null
)
```

