# Repull::ListingDeletedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ListingWebhookObject**](ListingWebhookObject.md) |  |  |
| **reason** | **String** |  | [optional] |
| **deleted_at** | **Time** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingDeletedPayload.new(
  object: null,
  reason: unlinked,
  deleted_at: null
)
```

