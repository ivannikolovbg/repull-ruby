# Repull::UpdateVrboListingAmenities200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **groups** | [**Hash&lt;String, GetVrboListingAmenities200ResponseDataGroupsValue&gt;**](GetVrboListingAmenities200ResponseDataGroupsValue.md) | Keyed by group: essentials, internet, climateControl, general, office, kitchenAndDining, parking, poolAndSpa, sustainability, entertainment, outdoor, onsiteService, accessibility, homeSafety, safetyDevices, enhancedCleaning, locationAndView, localAttractionsAndActivities, checkoutInstructions. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingAmenities200ResponseData.new(
  groups: null
)
```

