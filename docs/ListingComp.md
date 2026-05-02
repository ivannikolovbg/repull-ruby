# Repull::ListingComp

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **comp_id** | **Integer** |  | [optional] |
| **listing_name** | **String** |  | [optional] |
| **distance_km** | **Float** | Haversine distance from the source listing in km, rounded to 3 decimals. | [optional] |
| **bedrooms** | **Integer** |  | [optional] |
| **max_guests** | **Integer** |  | [optional] |
| **ratings** | [**ListingCompRatings**](ListingCompRatings.md) |  | [optional] |
| **currency** | **String** |  | [optional] |
| **current_nightly_rate** | **Float** | Latest snapshot ADR — fallback to render when the calendar window is empty. | [optional] |
| **nightly** | [**Array&lt;ListingCompNightly&gt;**](ListingCompNightly.md) | Per-day rate + availability for the requested window. May be empty if Atlas hasn&#39;t snapshotted the comp recently. | [optional] |
| **lat** | **Float** |  | [optional] |
| **lng** | **Float** |  | [optional] |
| **platform** | **String** |  | [optional] |
| **external_url** | **String** | Link to the listing on its source platform when one is available. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingComp.new(
  comp_id: null,
  listing_name: null,
  distance_km: null,
  bedrooms: null,
  max_guests: null,
  ratings: null,
  currency: null,
  current_nightly_rate: null,
  nightly: null,
  lat: null,
  lng: null,
  platform: airbnb,
  external_url: null
)
```

