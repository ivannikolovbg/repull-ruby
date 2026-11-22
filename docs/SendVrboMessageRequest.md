# Repull::SendVrboMessageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | The text to send to the guest. |  |
| **media_url** | **String** | Accepted for the same body as Airbnb; Vrbo carries no files, so a send with one is refused (&#x60;attachments_not_supported&#x60;). | [optional] |
| **media_type** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SendVrboMessageRequest.new(
  message: null,
  media_url: null,
  media_type: null
)
```

