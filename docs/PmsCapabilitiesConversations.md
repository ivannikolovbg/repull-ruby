# Repull::PmsCapabilitiesConversations

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **_send** | **Boolean** |  | [optional] |
| **attachments** | **Boolean** | &#x60;attachments&#x60; on &#x60;POST /v1/conversations/{id}/messages&#x60;. | [optional] |
| **channel_select** | **Boolean** | &#x60;channel&#x60; on &#x60;POST /v1/conversations/{id}/messages&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PmsCapabilitiesConversations.new(
  _send: null,
  attachments: null,
  channel_select: null
)
```

