# Repull::ErrorError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** |  | [optional] |
| **message** | **String** |  | [optional] |
| **docs_url** | **String** |  | [optional] |
| **example** | **String** | Example of correct usage | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ErrorError.new(
  code: invalid_api_key,
  message: The API key provided is invalid.,
  docs_url: https://repull.dev/docs/errors#invalid_api_key,
  example: null
)
```

