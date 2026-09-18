# Repull::AirbnbSafetyDisclosure

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | What is being disclosed. &#x60;surveillance&#x60; &#x3D; exterior security cameras or recording devices. &#x60;noise_monitor&#x60; &#x3D; a decibel monitor is installed. &#x60;requires_stairs&#x60;, &#x60;potential_noise&#x60;, &#x60;animals&#x60; (farm or wild animals nearby), &#x60;has_pets&#x60; (the host&#39;s pets), &#x60;limited_parking&#x60;, &#x60;limited_amenities&#x60;, &#x60;shared_spaces&#x60;, &#x60;pool_or_jacuzzi_with_no_fence&#x60;, &#x60;heights_with_no_fence&#x60;, &#x60;climbing_or_play_structure&#x60;, &#x60;lake_or_river_or_water_body&#x60;, &#x60;weapons&#x60;. |  |
| **value** | **Boolean** | Whether it applies to this property. |  |
| **declared** | **Boolean** | Read only: whether Airbnb holds an explicit answer for this type on this listing (as opposed to it simply not being declared). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbSafetyDisclosure.new(
  type: null,
  value: null,
  declared: null
)
```

