# Repull::MarketBrowseCategory

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **country** | **String** | ISO 3166-1 alpha-2. | [optional] |
| **count** | **Integer** | Number of Atlas-tracked cities in this country. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MarketBrowseCategory.new(
  country: null,
  count: null
)
```

