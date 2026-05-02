# Repull::MarketBrowsePagination

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **next_cursor** | **String** | Opaque cursor for the next page; null when no more results. | [optional] |
| **has_more** | **Boolean** |  | [optional] |
| **total_in_filter** | **Integer** | Total markets matching the current &#x60;q&#x60;/&#x60;country&#x60;/&#x60;min_listings&#x60; filter (ignores cursor). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketBrowsePagination.new(
  next_cursor: null,
  has_more: null,
  total_in_filter: null
)
```

