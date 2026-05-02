# Repull::ConversationGuestContact

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  | [optional] |
| **value** | **String** |  | [optional] |
| **is_primary** | **Boolean** |  | [optional] |
| **is_verified** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConversationGuestContact.new(
  type: phone,
  value: null,
  is_primary: null,
  is_verified: null
)
```

