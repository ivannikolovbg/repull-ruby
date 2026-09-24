# Repull::MigrationChannelMapSourcesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** |  | [optional] |
| **supported** | **Boolean** | False when this PMS does not expose channel links. | [optional] |
| **error** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MigrationChannelMapSourcesInner.new(
  provider: null,
  supported: null,
  error: null
)
```

