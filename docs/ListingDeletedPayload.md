# Repull::ListingDeletedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **deleted_at** | **Time** |  | [optional] |
| **reason** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingDeletedPayload.new(
  id: 6250,
  deleted_at: 2026-05-01T16:00Z,
  reason: deactivated_by_owner
)
```

