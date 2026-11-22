# Repull::ListVrboThreadMessages200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;ListVrboThreadMessages200ResponseDataInner&gt;**](ListVrboThreadMessages200ResponseDataInner.md) |  | [optional] |
| **pagination** | [**ListAirbnbThreadMessages200ResponsePagination**](ListAirbnbThreadMessages200ResponsePagination.md) |  | [optional] |
| **data_freshness** | **Hash&lt;String, Object&gt;** | When this workspace&#39;s Vrbo data was last synced (&#x60;lastSyncedAt&#x60;, &#x60;stale&#x60;, &#x60;accounts[]&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListVrboThreadMessages200Response.new(
  data: null,
  pagination: null,
  data_freshness: null
)
```

