# Repull::CursorPagination

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **next_cursor** | **String** | Opaque base64-encoded cursor — pass back as &#x60;?cursor&#x3D;&lt;value&gt;&#x60;. &#x60;null&#x60; when there are no more pages. | [optional] |
| **has_more** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CursorPagination.new(
  next_cursor: null,
  has_more: null
)
```

