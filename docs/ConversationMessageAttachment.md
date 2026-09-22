# Repull::ConversationMessageAttachment

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **url** | **String** | Where to download the file. | [optional] |
| **image_url** | **String** | Same value as &#x60;url&#x60; (kept for older clients; it is not image-only). Use &#x60;url&#x60;. | [optional] |
| **type** | **String** | Coarse kind, derived from &#x60;contentType&#x60;. | [optional] |
| **content_type** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConversationMessageAttachment.new(
  id: null,
  url: null,
  image_url: null,
  type: null,
  content_type: image/jpeg,
  created_at: null
)
```

