# Repull::MarketEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **title** | **String** |  | [optional] |
| **category** | **String** |  | [optional] |
| **start_date** | **Date** |  | [optional] |
| **end_date** | **Date** |  | [optional] |
| **lat** | **Float** |  | [optional] |
| **lng** | **Float** |  | [optional] |
| **rank** | **Float** |  | [optional] |
| **local_rank** | **Float** |  | [optional] |
| **attendance** | **Integer** |  | [optional] |
| **demand_impact** | **String** |  | [optional] |
| **labels** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketEvent.new(
  id: null,
  title: null,
  category: null,
  start_date: null,
  end_date: null,
  lat: null,
  lng: null,
  rank: null,
  local_rank: null,
  attendance: null,
  demand_impact: null,
  labels: null
)
```

