# Repull::SendAirbnbMessageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | Message body to send to the guest. Optional when &#x60;mediaUrl&#x60; is set (it is then sent as a separate message after the file). | [optional] |
| **media_url** | **String** | Public https URL of one image or video to send (JPEG/PNG/GIF/WebP/MP4/QuickTime, up to 10 MB). Repull uploads it to Airbnb for you. | [optional] |
| **media_type** | **String** | Optional MIME type hint for &#x60;mediaUrl&#x60; (e.g. &#x60;image/jpeg&#x60;). The type is read from the file itself; this never overrides it. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SendAirbnbMessageRequest.new(
  message: null,
  media_url: null,
  media_type: null
)
```

