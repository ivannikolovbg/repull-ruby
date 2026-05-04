# Repull::AiOperationFailedPayloadError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** |  | [optional] |
| **message** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AiOperationFailedPayloadError.new(
  code: no_market_data,
  message: Insufficient comparable listings.
)
```

