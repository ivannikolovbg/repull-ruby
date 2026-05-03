# Repull::Pagination

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **next_cursor** | **String** | Opaque base64 cursor — pass back as &#x60;?cursor&#x3D;&lt;value&gt;&#x60;. &#x60;null&#x60; when there are no more pages. |  |
| **has_more** | **Boolean** |  |  |
| **total** | **Integer** | Total rows matching the current filter (across all pages). Present when &#x60;?include_total&#x3D;true&#x60; (the default on most endpoints). Omit &#x60;?include_total&#x3D;false&#x60; to skip the COUNT(*) on very large workspaces. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Pagination.new(
  next_cursor: null,
  has_more: null,
  total: null
)
```

