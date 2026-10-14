# Repull::TransactionPayout

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payout_id** | **String** | Reference of the payout this row belongs to. |  |
| **payout_date** | **String** |  |  |
| **paid_out_amount** | **Float** | On a payout row: the net paid out to the host. |  |
| **bank_destination** | **String** | Masked destination bank account the payout was sent to (Booking.com payouts, from the statement PDF). Null on channels/rows without one. | [optional] |
| **statement_url** | **String** | Link to the channel&#39;s original payout statement PDF — the authoritative settlement record (Booking.com). Null when none. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TransactionPayout.new(
  payout_id: gkvDj0Jm9ZaA6IiO,
  payout_date: null,
  paid_out_amount: 18597.12,
  bank_destination: NO***********404,
  statement_url: null
)
```

