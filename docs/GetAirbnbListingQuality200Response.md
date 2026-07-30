# Repull::GetAirbnbListingQuality200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | **Object** | Shape depends on &#x60;type&#x60;: an object &#x60;{ standards, issues }&#x60; for &#x60;all&#x60;/&#x60;standards&#x60;, or an array for &#x60;issues&#x60;/&#x60;stats&#x60;. |  |
| **data_freshness** | [**AirbnbDataFreshness**](AirbnbDataFreshness.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbListingQuality200Response.new(
  data: null,
  data_freshness: null
)
```

