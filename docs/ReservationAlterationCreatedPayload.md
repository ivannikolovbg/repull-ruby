# Repull::ReservationAlterationCreatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**AlterationWebhookObject**](AlterationWebhookObject.md) |  |  |
| **changes** | [**Hash&lt;String, AlterationChange&gt;**](AlterationChange.md) | Requested deltas keyed by field name (&#x60;checkIn&#x60;, &#x60;checkOut&#x60;, &#x60;guestCount&#x60;, &#x60;totalPrice&#x60;). Only changed fields appear. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationAlterationCreatedPayload.new(
  object: null,
  changes: {&quot;checkOut&quot;:{&quot;from&quot;:&quot;2026-06-16&quot;,&quot;to&quot;:&quot;2026-06-18&quot;},&quot;totalPrice&quot;:{&quot;from&quot;:&quot;1320.00&quot;,&quot;to&quot;:&quot;1760.00&quot;}}
)
```

