# Repull::AvailabilityWriteSettings

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **available** | **Boolean** | Block or unblock the dates. | [optional] |
| **price** | **Float** | Nightly base price. | [optional] |
| **min_nights** | **Integer** |  | [optional] |
| **max_nights** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AvailabilityWriteSettings.new(
  available: null,
  price: null,
  min_nights: null,
  max_nights: null
)
```

