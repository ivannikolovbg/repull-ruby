# Repull::GuestContact

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Contact channel type (&#x60;phone&#x60;, &#x60;email&#x60;, etc.). | [optional] |
| **value** | **String** |  | [optional] |
| **verified** | **Boolean** |  | [optional] |
| **is_primary** | **Boolean** |  | [optional] |
| **last_used** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GuestContact.new(
  type: phone,
  value: +15551234567,
  verified: null,
  is_primary: null,
  last_used: null
)
```

