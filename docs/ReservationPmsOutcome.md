# Repull::ReservationPmsOutcome

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** |  | [optional] |
| **reservation_id** | **String** | The PMS&#39;s own id for the booking. | [optional] |
| **applied** | **Array&lt;String&gt;** |  | [optional] |
| **errors** | [**Array&lt;ReservationPmsSectionError&gt;**](ReservationPmsSectionError.md) |  | [optional] |
| **partial** | **Boolean** |  | [optional] |
| **failed_sections** | [**Array&lt;ReservationPmsSectionError&gt;**](ReservationPmsSectionError.md) |  | [optional] |
| **quote** | [**ReservationPmsOutcomeQuote**](ReservationPmsOutcomeQuote.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationPmsOutcome.new(
  provider: hostaway,
  reservation_id: 4471923,
  applied: [&quot;reservation&quot;],
  errors: null,
  partial: false,
  failed_sections: null,
  quote: null
)
```

