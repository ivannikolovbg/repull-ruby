# Repull::SentAttachment

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** | Durable stored copy — the same &#x60;url&#x60; the message&#39;s &#x60;attachments&#x60; will show when read back. | [optional] |
| **type** | **String** |  | [optional] |
| **content_type** | **String** | Type read from the file&#39;s bytes. | [optional] |
| **filename** | **String** |  | [optional] |
| **size_bytes** | **Integer** |  | [optional] |
| **source_url** | **String** | The URL you sent. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SentAttachment.new(
  url: null,
  type: null,
  content_type: image/jpeg,
  filename: parking-map.jpg,
  size_bytes: 184233,
  source_url: null
)
```

