# Repull::StudioFile

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **path** | **String** | Project-relative path, e.g. &#x60;src/app/page.tsx&#x60;. | [optional] |
| **content** | **String** | UTF-8 file contents. | [optional] |
| **sha256** | **String** | SHA-256 hex digest of the content — use it to detect drift before writing. | [optional] |
| **size** | **Integer** | Byte length of the content. | [optional] |
| **updated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::StudioFile.new(
  path: null,
  content: null,
  sha256: null,
  size: null,
  updated_at: null
)
```

