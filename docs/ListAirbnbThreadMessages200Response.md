# Repull::ListAirbnbThreadMessages200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;ListAirbnbThreadMessages200ResponseDataInner&gt;**](ListAirbnbThreadMessages200ResponseDataInner.md) |  | [optional] |
| **pagination** | [**ListAirbnbThreadMessages200ResponsePagination**](ListAirbnbThreadMessages200ResponsePagination.md) |  | [optional] |
| **data_freshness** | **Hash&lt;String, Object&gt;** | When this workspace&#39;s Airbnb data was last synced. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListAirbnbThreadMessages200Response.new(
  data: null,
  pagination: null,
  data_freshness: null
)
```

