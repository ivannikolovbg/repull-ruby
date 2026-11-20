# Repull::ConversationGuest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **display_name** | **String** |  | [optional] |
| **contacts** | [**Array&lt;ConversationGuestContact&gt;**](ConversationGuestContact.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConversationGuest.new(
  id: null,
  display_name: null,
  contacts: null
)
```

