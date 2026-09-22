# Repull::ListingSuspensionPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ListingWebhookObject**](ListingWebhookObject.md) |  |  |
| **reason** | **String** | The channel&#39;s stated reason, verbatim, when it gives one. | [optional] |
| **occurred_at** | **Time** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::ListingSuspensionPayload.new(
  object: null,
  reason: quality_standards,
  occurred_at: null
)
```

