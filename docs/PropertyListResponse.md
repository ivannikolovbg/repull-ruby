# Repull::PropertyListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **plan_notice** | [**PlanNotice**](PlanNotice.md) |  | [optional] |
| **data** | [**Array&lt;Property&gt;**](Property.md) |  | [optional] |
| **pagination** | [**Pagination**](Pagination.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PropertyListResponse.new(
  plan_notice: null,
  data: null,
  pagination: null
)
```

