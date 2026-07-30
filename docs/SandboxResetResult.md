# Repull::SandboxResetResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **customer_id** | **String** |  |  |
| **reset_at** | **Time** |  |  |
| **deleted** | [**SandboxResetResultDeleted**](SandboxResetResultDeleted.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::SandboxResetResult.new(
  customer_id: 1,
  reset_at: null,
  deleted: null
)
```

