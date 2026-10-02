# Repull::ConnectionAction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **required** | **Boolean** | Whether a host action is pending. |  |
| **reason** | **String** | Machine-readable reason, stable for programmatic handling. | [optional] |
| **message** | **String** | Host-facing one-liner describing what to do. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectionAction.new(
  required: null,
  reason: needs_permissions,
  message: null
)
```

