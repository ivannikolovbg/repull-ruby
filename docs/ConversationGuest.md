# Repull::ConversationGuest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **display_name** | **String** |  | [optional] |
| **avatar_url** | **String** |  | [optional] |
| **contacts** | [**Array&lt;ConversationGuestContact&gt;**](ConversationGuestContact.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConversationGuest.new(
  id: null,
  display_name: null,
  avatar_url: null,
  contacts: null
)
```

