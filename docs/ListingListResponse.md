# Repull::ListingListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **plan_notice** | [**PlanNotice**](PlanNotice.md) |  | [optional] |
| **data** | [**Array&lt;Listing&gt;**](Listing.md) |  | [optional] |
| **pagination** | [**Pagination**](Pagination.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingListResponse.new(
  plan_notice: null,
  data: null,
  pagination: null
)
```

