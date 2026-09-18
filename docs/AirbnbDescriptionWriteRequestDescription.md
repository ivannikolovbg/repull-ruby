# Repull::AirbnbDescriptionWriteRequestDescription

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **summary** | **String** | Airbnb hard-caps this at 500 characters and refuses the whole write if it is longer. | [optional] |
| **space** | **String** |  | [optional] |
| **access** | **String** |  | [optional] |
| **interaction** | **String** |  | [optional] |
| **neighborhood_overview** | **String** |  | [optional] |
| **transit** | **String** |  | [optional] |
| **notes** | **String** |  | [optional] |
| **house_rules** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbDescriptionWriteRequestDescription.new(
  name: null,
  summary: null,
  space: null,
  access: null,
  interaction: null,
  neighborhood_overview: null,
  transit: null,
  notes: null,
  house_rules: null
)
```

