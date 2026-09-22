# Repull::PaymentCompletedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**PaymentWebhookObject**](PaymentWebhookObject.md) |  |  |
| **completed_at** | **Time** |  | [optional] |
| **reason** | **String** |  | [optional] |
| **revision** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PaymentCompletedPayload.new(
  object: null,
  completed_at: null,
  reason: null,
  revision: null
)
```

