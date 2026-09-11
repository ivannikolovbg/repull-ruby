# Repull::ReservationGuestFinancials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total_price** | **Float** | Stay total the guest paid, in &#x60;currency&#x60;. Taken from the stored breakdown; falls back to the reservation total when the breakdown carries no total of its own. | [optional] |
| **fees** | [**Array&lt;ReservationMoneyLine&gt;**](ReservationMoneyLine.md) | Every fee line the guest was charged — cleaning, extra guest, pass-through host fees, platform guest service fee, channel add-ons. Deduplicated: channels that report a fee both as an array line and as a scalar (e.g. &#x60;cleaning&#x60;) yield ONE line. | [optional] |
| **taxes** | [**Array&lt;ReservationMoneyLine&gt;**](ReservationMoneyLine.md) | Every tax line the guest was charged. Same collection as &#x60;financials.host.taxes&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationGuestFinancials.new(
  total_price: 739.32,
  fees: null,
  taxes: null
)
```

