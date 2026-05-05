# Repull::ReservationFinancials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total_price** | **Float** | Stay total in &#x60;currency&#x60;. Number, not string. | [optional] |
| **currency** | **String** | ISO 4217 currency code. | [optional] |
| **payment_status** | **String** | Payment lifecycle status (e.g. &#x60;pending&#x60;, &#x60;paid&#x60;, &#x60;refunded&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationFinancials.new(
  total_price: 1250,
  currency: USD,
  payment_status: null
)
```

