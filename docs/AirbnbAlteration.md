# Repull::AirbnbAlteration

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **alteration_id** | **String** | Airbnb alteration id. | [optional] |
| **reservation_id** | **Integer** | Repull reservation id the alteration belongs to. | [optional] |
| **platform** | **String** |  | [optional] |
| **status** | **String** | Alteration status (e.g. &#x60;pending&#x60;). | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbAlteration.new(
  alteration_id: null,
  reservation_id: null,
  platform: airbnb,
  status: null,
  created_at: null
)
```

