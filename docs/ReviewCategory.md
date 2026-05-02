# Repull::ReviewCategory

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **category** | **String** |  | [optional] |
| **rating** | **Float** | Per-category rating on the platform&#39;s scale (typically 1..5). | [optional] |
| **comment** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReviewCategory.new(
  category: cleanliness,
  rating: null,
  comment: null
)
```

