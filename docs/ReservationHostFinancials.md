# Repull::ReservationHostFinancials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accommodation** | **Float** | Accommodation subtotal before fees, taxes and discounts. | [optional] |
| **discounts** | [**Array&lt;ReservationMoneyLine&gt;**](ReservationMoneyLine.md) | Discounts applied to the stay (length-of-stay, non-refundable, promotional). Amounts are positive magnitudes of the reduction. | [optional] |
| **guest_fees** | [**Array&lt;ReservationMoneyLine&gt;**](ReservationMoneyLine.md) | The guest-side platform service fee as it appears on the host statement. Present only on channels that report it (Airbnb). | [optional] |
| **host_fees** | [**Array&lt;ReservationMoneyLine&gt;**](ReservationMoneyLine.md) | Fees the channel charged the HOST — host service fee / commission (with &#x60;vat&#x60; split out where the channel provides it), platform fee, payment processing fee. | [optional] |
| **taxes** | [**Array&lt;ReservationMoneyLine&gt;**](ReservationMoneyLine.md) | Taxes on the stay. Same collection as &#x60;financials.guest.taxes&#x60; — each line&#39;s &#x60;type&#x60; says who remits (&#x60;airbnb_collected&#x60; &#x3D; the channel already collected and remitted it, &#x60;pass_through&#x60; &#x3D; it reaches the host). The API deliberately does not split the list by remitter, so no classification of ours is baked into the payload. | [optional] |
| **revenue** | **Float** | Expected host payout for the stay, in &#x60;currency&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationHostFinancials.new(
  accommodation: 485,
  discounts: null,
  guest_fees: null,
  host_fees: null,
  taxes: null,
  revenue: 566.72
)
```

