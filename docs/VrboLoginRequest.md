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
| **phone** | **String** | &#x60;action: phone&#x60; — the contact phone with its country code, e.g. &#x60;+373 69 123 456&#x60;. | [optional] |
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
  phone: null,
  access_type: null
)
```

