# Repull::AutoMapConnectionUnits200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **connection_id** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **applied** | **Boolean** |  | [optional] |
| **results** | [**Array&lt;AutoMapConnectionUnits200ResponseResultsInner&gt;**](AutoMapConnectionUnits200ResponseResultsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AutoMapConnectionUnits200Response.new(
  connection_id: null,
  channel: null,
  applied: null,
  results: null
)
```

