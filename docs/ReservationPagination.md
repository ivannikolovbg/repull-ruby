# Repull::ReservationPagination

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **next_cursor** | **String** | Opaque base64 cursor — pass back as &#x60;?cursor&#x3D;&lt;value&gt;&#x60;. &#x60;null&#x60; when there are no more pages. |  |
| **has_more** | **Boolean** |  |  |
| **total** | **Integer** | Total rows matching the current filter (across all pages). |  |
| **limit** | **Integer** | Deprecated — only present on responses to &#x60;?offset&#x3D;&#x60; requests. | [optional] |
| **offset** | **Integer** | Deprecated — only present on responses to &#x60;?offset&#x3D;&#x60; requests. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationPagination.new(
  next_cursor: null,
  has_more: null,
  total: null,
  limit: null,
  offset: null
)
```

