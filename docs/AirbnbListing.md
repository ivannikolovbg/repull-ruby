# Repull::AirbnbListing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** | Repull listing id | [optional] |
| **name** | **String** | The host&#39;s internal nickname for the listing. | [optional] |
| **public_name** | **String** | The title guests see on the channel (e.g. the Airbnb listing title). &#x60;name&#x60; is the host&#39;s internal nickname for the listing; show &#x60;publicName&#x60; in anything a guest or end user reads. Present on inactive rows too. | [optional] |
| **city** | **String** |  | [optional] |
| **thumbnail_url** | **String** | Cover photo URL for the listing. **Only present when the caller passes &#x60;?include&#x3D;thumbnail&#x60;.** &#x60;null&#x60; when the listing has no cover photo stored — the listing is still returned. | [optional] |
| **connections** | [**Array&lt;AirbnbConnection&gt;**](AirbnbConnection.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbListing.new(
  listing_id: 6248,
  name: Oceanview Villa,
  public_name: Centre Oxford bright single room D,
  city: Malibu,
  thumbnail_url: null,
  connections: null
)
```

