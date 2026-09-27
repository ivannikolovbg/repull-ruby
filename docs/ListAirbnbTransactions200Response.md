# Repull::ListAirbnbTransactions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;AirbnbTransaction&gt;**](AirbnbTransaction.md) |  |  |
| **pagination** | [**Pagination**](Pagination.md) |  |  |
| **data_freshness** | [**AirbnbDataFreshness**](AirbnbDataFreshness.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ListAirbnbTransactions200Response.new(
  data: null,
  pagination: null,
  data_freshness: null
)
```

