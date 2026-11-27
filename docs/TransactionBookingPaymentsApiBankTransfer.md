# Repull::TransactionBookingPaymentsApiBankTransfer

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reference** | **String** | Booking.com bank-transfer reference; matches the payout on your bank statement. | [optional] |
| **status** | **String** |  | [optional] |
| **date** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TransactionBookingPaymentsApiBankTransfer.new(
  reference: ST-D0L8H1W4W9I5,
  status: PAID,
  date: 2026-05-04
)
```

