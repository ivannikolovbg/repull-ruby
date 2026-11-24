# Repull::TiketOccupancyPrice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **guests** | **Integer** |  |  |
| **amount** | **Float** | Price per night for this many guests, tax included, in &#x60;currency&#x60;. |  |

## Example

```ruby
require 'repull'

instance = Repull::TiketOccupancyPrice.new(
  guests: 2,
  amount: 850000
)
```

