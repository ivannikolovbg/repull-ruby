# Repull::SyncTiketRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | tiket.com Hotel ID. Omit for every active property. | [optional] |
| **refresh_products** | **Boolean** | Re-read room types and rate plans first. | [optional][default to false] |

## Example

```ruby
require 'repull'

instance = Repull::SyncTiketRequest.new(
  property_id: null,
  refresh_products: null
)
```

