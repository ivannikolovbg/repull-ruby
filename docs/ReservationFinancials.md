# Repull::ReservationFinancials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total_price** | **Float** | GUEST-side stay total in &#x60;currency&#x60; — what the guest paid, not the host payout. Number, not string. For the host payout see &#x60;financials.host.revenue&#x60;. | [optional] |
| **currency** | **String** | ISO 4217 currency code. | [optional] |
| **payment_status** | **String** | Payment lifecycle status (e.g. &#x60;pending&#x60;, &#x60;paid&#x60;, &#x60;refunded&#x60;). | [optional] |
| **cancellation_policy** | **String** | Channel cancellation policy code, verbatim from the reservation. Airbnb codes look like &#x60;strict_14_with_grace_period&#x60;, &#x60;moderate&#x60;, &#x60;flexible&#x60;, &#x60;tiered_pricing_non_refundable&#x60;; Booking.com reports a numeric policy id. Omitted when the channel did not supply one. | [optional] |
| **host** | [**ReservationHostFinancials**](ReservationHostFinancials.md) |  | [optional] |
| **guest** | [**ReservationGuestFinancials**](ReservationGuestFinancials.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationFinancials.new(
  total_price: 1250,
  currency: USD,
  payment_status: null,
  cancellation_policy: strict_14_with_grace_period,
  host: null,
  guest: null
)
```

