# Repull::ReservationQuoteResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **provider** | **String** | The PMS that priced it. | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **available** | **Boolean** | Whether the PMS would take the booking as asked. | [optional] |
| **total** | **Float** | Total for the stay, in &#x60;currency&#x60;. Null when the PMS gave no price (e.g. not available). | [optional] |
| **currency** | **String** |  | [optional] |
| **breakdown** | [**ReservationQuoteResponseBreakdown**](ReservationQuoteResponseBreakdown.md) |  | [optional] |
| **restrictions** | **Array&lt;String&gt;** | The PMS&#39;s reasons, verbatim, when &#x60;available&#x60; is false. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationQuoteResponse.new(
  listing_id: 4118,
  provider: hostaway,
  check_in: null,
  check_out: null,
  available: true,
  total: 880,
  currency: USD,
  breakdown: null,
  restrictions: []
)
```

