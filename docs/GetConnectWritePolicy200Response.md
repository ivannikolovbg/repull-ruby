# Repull::GetConnectWritePolicy200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** |  | [optional] |
| **write_policy** | [**PmsWritePolicy**](PmsWritePolicy.md) |  | [optional] |
| **defaults** | [**PmsWritePolicy**](PmsWritePolicy.md) | What this provider starts with. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetConnectWritePolicy200Response.new(
  provider: cloudbeds,
  write_policy: null,
  defaults: null
)
```

