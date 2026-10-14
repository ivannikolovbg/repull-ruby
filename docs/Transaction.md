# Repull::Transaction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transaction_id** | **String** | Stable id of the transaction (the underlying payment id). Upsert on it. |  |
| **platform** | **String** | Normalized channel: &#x60;airbnb&#x60;, &#x60;booking&#x60; (Booking.com, however connected — never &#x60;booking_extranet&#x60;), or &#x60;vrbo&#x60;. |  |
| **type** | **String** | Transaction type: &#x60;Payout&#x60;, &#x60;Reservation&#x60;, &#x60;Refund&#x60;, … | [optional] |
| **is_payout** | **Boolean** | &#x60;true&#x60; when this is money that reached the host (a payout). |  |
| **status** | **String** | Normalized settlement status (&#x60;COMPLETED&#x60; / &#x60;UPCOMING&#x60;; the raw value passes through when it maps to neither). | [optional] |
| **date** | **String** | Transaction / payout date (the channel&#39;s display form or ISO). | [optional] |
| **currency** | **String** |  | [optional] |
| **amount** | **Float** | Net amount; for a payout, what the host received. | [optional] |
| **gross_amount** | **Float** | Guest-paid gross (payouts). | [optional] |
| **fees** | [**TransactionFees**](TransactionFees.md) |  |  |
| **payout** | [**TransactionPayout**](TransactionPayout.md) |  |  |
| **confirmation_code** | **String** |  | [optional] |
| **reservation_id** | **Integer** |  | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **synced_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Transaction.new(
  transaction_id: booking_payout_5463377687_bank_transfer,
  platform: booking,
  type: Payout,
  is_payout: null,
  status: COMPLETED,
  date: 27 Aug 2026,
  currency: NOK,
  amount: 18597.12,
  gross_amount: 22272,
  fees: null,
  payout: null,
  confirmation_code: 5463377687,
  reservation_id: null,
  listing_id: null,
  synced_at: null
)
```

