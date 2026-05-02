# Repull::ListingPublishStatusChannel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **platform** | **String** |  | [optional] |
| **push_status** | **String** |  | [optional] |
| **last_pushed_at** | **Time** |  | [optional] |
| **last_pulled_at** | **Time** |  | [optional] |
| **dirty_fields** | **Array&lt;String&gt;** |  | [optional] |
| **platform_has_changes** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPublishStatusChannel.new(
  platform: airbnb,
  push_status: null,
  last_pushed_at: null,
  last_pulled_at: null,
  dirty_fields: null,
  platform_has_changes: null
)
```

