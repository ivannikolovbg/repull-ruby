# Repull::PaymentRefundedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**PaymentWebhookObject**](PaymentWebhookObject.md) |  |  |
| **refunded_at** | **Time** |  | [optional] |
| **reason** | **String** |  | [optional] |
| **revision** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PaymentRefundedPayload.new(
  object: null,
  refunded_at: null,
  reason: Resolution centre adjustment,
  revision: null
)
```

