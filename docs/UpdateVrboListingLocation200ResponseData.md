# Repull::UpdateVrboListingLocation200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address** | **Object** | The address (read-only: Vrbo changes it only through its support). | [optional] |
| **address_editable** | **Boolean** |  | [optional] |
| **show_exact_location** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingLocation200ResponseData.new(
  address: null,
  address_editable: null,
  show_exact_location: null
)
```

