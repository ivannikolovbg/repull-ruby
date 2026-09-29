# Repull::ApplyConnectionMappingsRequestMappingsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unit_id** | **String** |  |  |
| **listing_id** | **Integer** |  | [optional] |
| **create** | **Boolean** |  | [optional] |
| **calendar_sync** | **Boolean** | Vrbo: push this listing&#39;s prices and availability to Vrbo. Omit to follow the connection&#39;s access type (&#x60;messaging&#x60; &#x3D; off, &#x60;full_access&#x60; &#x3D; on). A new listing (&#x60;create&#x60;) always follows the access type. Other channels ignore it. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ApplyConnectionMappingsRequestMappingsInner.new(
  unit_id: null,
  listing_id: null,
  create: null,
  calendar_sync: null
)
```

