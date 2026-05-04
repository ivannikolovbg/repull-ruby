# Repull::AirbnbListing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** | Vanio (Repull) listing id | [optional] |
| **name** | **String** | Listing title | [optional] |
| **city** | **String** |  | [optional] |
| **connections** | [**Array&lt;AirbnbConnection&gt;**](AirbnbConnection.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbListing.new(
  listing_id: 6248,
  name: Oceanview Villa,
  city: Malibu,
  connections: null
)
```

