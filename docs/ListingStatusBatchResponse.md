# Repull::ListingStatusBatchResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **active** | **Boolean** | The state every listing in the request is now in. |  |
| **updated** | **Array&lt;String&gt;** | Listing ids whose state this call changed, in request order. |  |
| **unchanged** | **Array&lt;String&gt;** | Listing ids that were already in the requested state, in request order. |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingStatusBatchResponse.new(
  active: null,
  updated: null,
  unchanged: null
)
```

