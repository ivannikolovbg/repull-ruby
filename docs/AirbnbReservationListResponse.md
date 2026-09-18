# Repull::AirbnbReservationListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;AirbnbReservation&gt;**](AirbnbReservation.md) |  | [optional] |
| **pagination** | [**Pagination**](Pagination.md) |  | [optional] |
| **data_freshness** | [**AirbnbDataFreshness**](AirbnbDataFreshness.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbReservationListResponse.new(
  data: null,
  pagination: null,
  data_freshness: null
)
```

