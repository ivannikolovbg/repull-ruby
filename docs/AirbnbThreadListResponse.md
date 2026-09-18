# Repull::AirbnbThreadListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;AirbnbThread&gt;**](AirbnbThread.md) |  | [optional] |
| **pagination** | [**Pagination**](Pagination.md) |  | [optional] |
| **data_freshness** | [**AirbnbDataFreshness**](AirbnbDataFreshness.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbThreadListResponse.new(
  data: null,
  pagination: null,
  data_freshness: null
)
```

