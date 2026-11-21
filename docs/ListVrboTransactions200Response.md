# Repull::ListVrboTransactions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;ListVrboTransactions200ResponseDataInner&gt;**](ListVrboTransactions200ResponseDataInner.md) |  | [optional] |
| **pagination** | [**Pagination**](Pagination.md) |  | [optional] |
| **data_freshness** | [**ListVrboTransactions200ResponseDataFreshness**](ListVrboTransactions200ResponseDataFreshness.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListVrboTransactions200Response.new(
  data: null,
  pagination: null,
  data_freshness: null
)
```

