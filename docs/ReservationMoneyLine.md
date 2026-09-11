# Repull::ReservationMoneyLine

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Label as the channel reported it. | [optional] |
| **type** | **String** | Channel-reported classifier. NOT an enum — new channels introduce new values. Observed on fees: &#x60;cleaning&#x60;, &#x60;extra_guest&#x60;, &#x60;service&#x60;, &#x60;guest_service&#x60;, &#x60;pet&#x60;, &#x60;fixed&#x60;, &#x60;add_on&#x60;, &#x60;host_service&#x60;, &#x60;platform&#x60;, &#x60;processing&#x60;. Observed on taxes: &#x60;airbnb_collected&#x60; (channel collected AND remitted it), &#x60;pass_through&#x60; (reaches the host to remit), &#x60;tax&#x60;, &#x60;custom&#x60;. | [optional] |
| **amount** | **Float** | Amount in the reservation &#x60;currency&#x60;. |  |
| **description** | **String** | Longer channel-supplied description. Only present when it differs from &#x60;name&#x60;. | [optional] |
| **quantity** | **Float** | Units billed, when the channel reports a quantity (Booking.com add-ons). | [optional] |
| **vat** | **Float** | VAT charged on top of this line, when the channel splits it out separately. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMoneyLine.new(
  name: Cleaning Fee,
  type: cleaning,
  amount: 126,
  description: Extra guest fee for 1 additional guest(s),
  quantity: 1,
  vat: 0
)
```

