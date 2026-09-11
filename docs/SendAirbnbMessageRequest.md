# Repull::SendAirbnbMessageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | Message body to send to the guest. |  |
| **media_url** | **String** | Optional URL of an image/media attachment to send with the message. | [optional] |
| **media_type** | **String** | Optional MIME/media type hint for &#x60;mediaUrl&#x60; (e.g. &#x60;image/jpeg&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SendAirbnbMessageRequest.new(
  message: null,
  media_url: null,
  media_type: null
)
```

