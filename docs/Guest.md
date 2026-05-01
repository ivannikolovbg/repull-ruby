# Repull::Guest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **first_name** | **String** |  | [optional] |
| **last_name** | **String** |  | [optional] |
| **email** | **String** |  | [optional] |
| **phone** | **String** |  | [optional] |
| **total_stays** | **Integer** |  | [optional] |
| **total_revenue** | **Float** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Guest.new(
  id: null,
  first_name: Jane,
  last_name: Doe,
  email: null,
  phone: null,
  total_stays: null,
  total_revenue: null
)
```

