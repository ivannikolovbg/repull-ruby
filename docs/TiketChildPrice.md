# Repull::TiketChildPrice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **min_age** | **Integer** |  |  |
| **max_age** | **Integer** |  |  |
| **amount** | **Float** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::TiketChildPrice.new(
  min_age: 0,
  max_age: 11,
  amount: 100000
)
```

