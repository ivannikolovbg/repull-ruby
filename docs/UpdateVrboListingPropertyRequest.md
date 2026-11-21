# Repull::UpdateVrboListingPropertyRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_type** | **String** | One of the read&#39;s &#x60;propertyTypeOptions[].value&#x60;. | [optional] |
| **property_name** | **String** | Internal name (not shown to guests). | [optional] |
| **interior_size** | [**UpdateVrboListingPropertyRequestInteriorSize**](UpdateVrboListingPropertyRequestInteriorSize.md) |  | [optional] |
| **seniors_only** | **Boolean** |  | [optional] |
| **long_term_renters_welcome** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingPropertyRequest.new(
  property_type: null,
  property_name: null,
  interior_size: null,
  seniors_only: null,
  long_term_renters_welcome: null
)
```

