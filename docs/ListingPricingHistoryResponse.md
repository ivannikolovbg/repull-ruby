# Repull::ListingPricingHistoryResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;ListingPricingHistoryEntry&gt;**](ListingPricingHistoryEntry.md) |  | [optional] |
| **pagination** | [**CursorPagination**](CursorPagination.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPricingHistoryResponse.new(
  data: null,
  pagination: null
)
```

