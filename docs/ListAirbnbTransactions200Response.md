# Repull::ListAirbnbTransactions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;AirbnbTransaction&gt;**](AirbnbTransaction.md) |  |  |
| **data_freshness** | [**AirbnbDataFreshness**](AirbnbDataFreshness.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ListAirbnbTransactions200Response.new(
  data: null,
  data_freshness: null
)
```

