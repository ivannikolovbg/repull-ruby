# Repull::ConnectionListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **plan_notice** | [**PlanNotice**](PlanNotice.md) |  | [optional] |
| **data** | [**Array&lt;Connection&gt;**](Connection.md) |  | [optional] |
| **pagination** | [**Pagination**](Pagination.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectionListResponse.new(
  plan_notice: null,
  data: null,
  pagination: null
)
```

