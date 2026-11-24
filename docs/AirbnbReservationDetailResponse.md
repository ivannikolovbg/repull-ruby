# Repull::AirbnbReservationDetailResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**AirbnbReservationDetail**](AirbnbReservationDetail.md) |  |  |
| **data_freshness** | [**AirbnbDataFreshness**](AirbnbDataFreshness.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbReservationDetailResponse.new(
  data: null,
  data_freshness: null
)
```

