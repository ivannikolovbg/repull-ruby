# Repull::AirbnbReviewListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;AirbnbReview&gt;**](AirbnbReview.md) |  | [optional] |
| **pagination** | [**Pagination**](Pagination.md) |  | [optional] |
| **data_freshness** | [**AirbnbDataFreshness**](AirbnbDataFreshness.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbReviewListResponse.new(
  data: null,
  pagination: null,
  data_freshness: null
)
```

