# Repull::BulkPricingItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **dates** | **Array&lt;Date&gt;** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::BulkPricingItem.new(
  listing_id: 4118,
  dates: [&quot;2026-05-14&quot;,&quot;2026-05-15&quot;]
)
```

