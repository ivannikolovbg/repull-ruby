# Repull::UpdateVrboListingRoomsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **add** | [**Array&lt;UpdateVrboListingRoomsRequestAddInner&gt;**](UpdateVrboListingRoomsRequestAddInner.md) |  | [optional] |
| **update** | [**Array&lt;UpdateVrboListingRoomsRequestUpdateInner&gt;**](UpdateVrboListingRoomsRequestUpdateInner.md) |  | [optional] |
| **delete** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingRoomsRequest.new(
  add: null,
  update: null,
  delete: null
)
```

