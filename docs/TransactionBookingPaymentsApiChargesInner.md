# Repull::TransactionBookingPaymentsApiChargesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Booking.com&#39;s label, e.g. &#x60;VAT&#x60;, &#x60;City tax&#x60;, &#x60;COMMISSION&#x60;, &#x60;PAYMENT CHARGE&#x60;. | [optional] |
| **category** | **String** |  | [optional] |
| **amount** | **Float** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **rate** | [**TransactionBookingPaymentsApiChargesInnerRate**](TransactionBookingPaymentsApiChargesInnerRate.md) |  | [optional] |
| **applicable_type** | **String** | e.g. &#x60;PER_PERSON&#x60;, &#x60;PER_NIGHT&#x60;. | [optional] |
| **already_collected_from_guest** | **Boolean** |  | [optional] |
| **included_in_payout** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TransactionBookingPaymentsApiChargesInner.new(
  type: VAT,
  category: null,
  amount: 10,
  currency: null,
  rate: null,
  applicable_type: null,
  already_collected_from_guest: null,
  included_in_payout: null
)
```

