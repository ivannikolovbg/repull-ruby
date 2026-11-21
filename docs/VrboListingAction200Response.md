# Repull::VrboListingAction200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **action** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **live** | **Boolean** | What Vrbo now shows (read back). | [optional] |
| **active** | **Boolean** | &#x60;delete&#x60;: the Repull record. | [optional] |
| **units** | [**Array&lt;VrboListingAction200ResponseUnitsInner&gt;**](VrboListingAction200ResponseUnitsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::VrboListingAction200Response.new(
  id: null,
  action: null,
  channel: vrbo,
  live: null,
  active: null,
  units: null
)
```

