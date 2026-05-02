# Repull::ListingChannel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **platform** | **String** |  | [optional] |
| **external_id** | **String** | ID in the platform (Airbnb listing id, Booking room id, etc.) | [optional] |
| **active** | **Boolean** |  | [optional] |
| **sync_enabled** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingChannel.new(
  platform: airbnb,
  external_id: null,
  active: null,
  sync_enabled: null
)
```

