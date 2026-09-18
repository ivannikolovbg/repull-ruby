# Repull::UpdateAirbnbListingSafetyDisclosures200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **airbnb_listing_id** | **String** |  | [optional] |
| **disclosures** | [**Array&lt;AirbnbSafetyDisclosure&gt;**](AirbnbSafetyDisclosure.md) | The set as Airbnb reports it after the write. | [optional] |
| **result** | **Hash&lt;String, Object&gt;** | Airbnb&#39;s raw booking-settings response. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateAirbnbListingSafetyDisclosures200Response.new(
  listing_id: null,
  airbnb_listing_id: null,
  disclosures: null,
  result: null
)
```

