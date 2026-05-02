# Repull::ListingPublishResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **Integer** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **result** | **Object** | Channel-specific push result (sections pushed, errors, etc.) | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPublishResponse.new(
  listing_id: null,
  channel: null,
  result: null
)
```

