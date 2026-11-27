# Repull::TransactionBookingPaymentsApi

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **source** | **String** |  | [optional] |
| **payment_tags** | **Array&lt;String&gt;** | &#x60;PAYMENTS_BY_BOOKING&#x60;, &#x60;PAYMENT_AT_PROPERTY&#x60; or &#x60;SMART_PAYMENT_AT_PROPERTY&#x60;. | [optional] |
| **payout_type** | **String** | &#x60;GROSS&#x60;, &#x60;NET&#x60; or &#x60;UNKNOWN&#x60;; null when the property collects the payment. | [optional] |
| **payout_status** | **String** | &#x60;PENDING&#x60;, &#x60;PAID&#x60;, &#x60;CANCELLED&#x60; or &#x60;UNKNOWN&#x60;. | [optional] |
| **currency** | **String** |  | [optional] |
| **gross_amount** | **Float** | What the guest paid Booking.com. | [optional] |
| **commission** | **Float** |  | [optional] |
| **payment_charge** | **Float** | Payments service charge. | [optional] |
| **vat** | **Float** |  | [optional] |
| **vat_on_fees** | **Float** | VAT on commission and on the payment charge. | [optional] |
| **taxes** | **Float** | City tax, withheld and other taxes. | [optional] |
| **net_amount** | **Float** | Estimated payout to the property. | [optional] |
| **amount_to_collect_at_property** | **Float** | Estimated amount the property collects itself (e.g. city tax, or the whole stay when the property collects the payment). | [optional] |
| **bank_transfer** | [**TransactionBookingPaymentsApiBankTransfer**](TransactionBookingPaymentsApiBankTransfer.md) |  | [optional] |
| **charges** | [**Array&lt;TransactionBookingPaymentsApiChargesInner&gt;**](TransactionBookingPaymentsApiChargesInner.md) | Per-room price lines as Booking.com reports them. | [optional] |
| **fetched_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TransactionBookingPaymentsApi.new(
  source: null,
  payment_tags: [&quot;PAYMENTS_BY_BOOKING&quot;],
  payout_type: NET,
  payout_status: PAID,
  currency: EUR,
  gross_amount: 120,
  commission: 18,
  payment_charge: 2,
  vat: 10,
  vat_on_fees: 2,
  taxes: 6.26,
  net_amount: 96.74,
  amount_to_collect_at_property: 5,
  bank_transfer: null,
  charges: null,
  fetched_at: null
)
```

