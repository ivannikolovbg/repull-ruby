# Repull::PaymentRefundedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **refund_id** | **String** |  | [optional] |
| **reservation_id** | **Integer** |  | [optional] |
| **amount** | **String** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **refunded_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PaymentRefundedPayload.new(
  id: pay_01HX5XPQ2K,
  refund_id: rfn_01HX5XPQ2K,
  reservation_id: 215906,
  amount: 1320.00,
  currency: USD,
  refunded_at: 2026-05-01T19:00Z
)
```

