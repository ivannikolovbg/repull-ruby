# Repull::GetVrboListingSafetyDisclosures200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **groups** | [**Hash&lt;String, GetVrboListingAmenities200ResponseDataGroupsValue&gt;**](GetVrboListingAmenities200ResponseDataGroupsValue.md) | Keyed by group: homeSafety, safetyDevices. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingSafetyDisclosures200ResponseData.new(
  groups: null
)
```

