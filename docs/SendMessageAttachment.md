# Repull::SendMessageAttachment

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** | Public https URL of the file. A signed URL valid for a few minutes is fine. |  |
| **content_type** | **String** | Optional hint, e.g. &#x60;image/jpeg&#x60;. The type is read from the file itself; this never overrides it. | [optional] |
| **filename** | **String** | Optional display name. Defaults to the last segment of the URL. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SendMessageAttachment.new(
  url: https://cdn.example.com/parking-map.jpg,
  content_type: image/jpeg,
  filename: parking-map.jpg
)
```

