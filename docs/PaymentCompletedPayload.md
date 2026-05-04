# Repull::PaymentCompletedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **reservation_id** | **Integer** |  | [optional] |
| **amount** | **String** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **method** | **String** |  | [optional] |
| **captured_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PaymentCompletedPayload.new(
  id: pay_01HX5XPQ2K,
  reservation_id: 215906,
  amount: 1320.00,
  currency: USD,
  method: card,
  captured_at: 2026-05-01T12:35Z
)
```

