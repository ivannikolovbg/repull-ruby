# Repull::GetAirbnbLocation200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address** | [**GetAirbnbLocation200ResponseDataAddress**](GetAirbnbLocation200ResponseDataAddress.md) |  | [optional] |
| **address_editable** | **Boolean** |  | [optional] |
| **lat** | **Float** |  | [optional] |
| **lng** | **Float** |  | [optional] |
| **show_exact_location** | **Boolean** |  | [optional] |
| **directions** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbLocation200ResponseData.new(
  address: null,
  address_editable: null,
  lat: null,
  lng: null,
  show_exact_location: null,
  directions: null
)
```

