# Repull::TiketSyncResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **synced** | **Integer** |  | [optional] |
| **failed** | **Integer** |  | [optional] |
| **results** | [**Array&lt;TiketSyncResponseResultsInner&gt;**](TiketSyncResponseResultsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketSyncResponse.new(
  synced: null,
  failed: null,
  results: null
)
```

