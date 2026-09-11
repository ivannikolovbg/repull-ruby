# Repull::AlterationChange

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | **Object** | Prior value (string date, integer count, or decimal price string). | [optional] |
| **to** | **Object** | Proposed value (string date, integer count, or decimal price string). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AlterationChange.new(
  from: null,
  to: null
)
```

