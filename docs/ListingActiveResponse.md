# Repull::ListingActiveResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The listing id (id fields are serialized as strings to preserve precision). | [optional] |
| **active** | **Boolean** | The resulting active state after the toggle. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingActiveResponse.new(
  id: null,
  active: null
)
```

