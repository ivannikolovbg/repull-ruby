# Repull::GetAirbnbListingSettings200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | **Object** | Shape depends on &#x60;type&#x60;: &#x60;{ hosts, locales }&#x60; for &#x60;all&#x60;, or an array for &#x60;hosts&#x60;/&#x60;permits&#x60;/&#x60;locales&#x60;. |  |
| **data_freshness** | [**AirbnbDataFreshness**](AirbnbDataFreshness.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::GetAirbnbListingSettings200Response.new(
  data: null,
  data_freshness: null
)
```

