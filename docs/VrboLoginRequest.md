# Repull::VrboLoginRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **session_id** | **String** |  |  |
| **action** | **String** |  |  |
| **email** | **String** |  | [optional] |
| **password** | **String** |  | [optional] |
| **account_id** | **Integer** |  | [optional] |
| **code** | **String** |  | [optional] |
| **access_type** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::VrboLoginRequest.new(
  session_id: null,
  action: null,
  email: null,
  password: null,
  account_id: null,
  code: null,
  access_type: null
)
```

