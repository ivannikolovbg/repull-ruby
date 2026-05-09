# Repull::ListingAmenity

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amenity_key** | **String** | Canonical amenity key (e.g. &#x60;wifi&#x60;, &#x60;pool&#x60;, &#x60;parking&#x60;). |  |
| **category** | **String** | Optional grouping (e.g. &#x60;essentials&#x60;, &#x60;safety&#x60;). | [optional] |
| **is_present** | **Boolean** | &#x60;true&#x60; when the listing has this amenity, &#x60;false&#x60; when it has been explicitly opted out. |  |
| **instruction** | **String** | Optional free-form instruction for the guest (e.g. WiFi password, parking notes). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingAmenity.new(
  amenity_key: wifi,
  category: null,
  is_present: null,
  instruction: null
)
```

