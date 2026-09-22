# Repull::PaymentWebhookObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **customer_id** | **Integer** |  |  |
| **transaction_type** | **String** | Repull&#39;s normalised vocabulary for what this movement is. |  |
| **source_type** | **String** | The source system&#39;s own type string, unmapped, for reconciling against the dashboard. | [optional] |
| **status** | **String** |  | [optional] |
| **amount** | **String** | Gross amount. Negative on adjustments and clawbacks — the sign is preserved so the direction never has to be inferred. |  |
| **currency** | **String** |  | [optional] |
| **reservation_id** | **Integer** | Present when the movement belongs to one reservation. Absent on batched payouts, which genuinely arrive without a reservation reference. | [optional] |
| **confirmation_code** | **String** | The channel&#39;s confirmation code, when resolved. | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **platform** | **String** |  | [optional] |
| **platform_payment_id** | **String** | The platform&#39;s own id. Airbnb payout ids look like &#x60;G-FRSLYC3ZKAJDQ&#x60;. | [optional] |
| **processing_fee** | **String** | Emitted only where the source carries it. | [optional] |
| **net_amount** | **String** | Emitted only where the source carries it. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PaymentWebhookObject.new(
  id: 277919,
  customer_id: 1,
  transaction_type: payout,
  source_type: Payout,
  status: completed,
  amount: 1792.17,
  currency: CAD,
  reservation_id: null,
  confirmation_code: null,
  listing_id: null,
  platform: airbnb,
  platform_payment_id: G-FRSLYC3ZKAJDQ,
  processing_fee: null,
  net_amount: null
)
```

