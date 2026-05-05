# Repull::ReservationUpdatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ReservationWebhookObject**](ReservationWebhookObject.md) |  |  |
| **previous_attributes** | **Hash&lt;String, Object&gt;** | Sparse map: every key here is a field on the reservation snapshot whose value changed in this event, mapped to its prior value. Mirrors the keys of &#x60;ReservationWebhookObject&#x60; (e.g. &#x60;checkinDate&#x60;, &#x60;checkoutDate&#x60;, &#x60;status&#x60;). Receivers can diff &#x60;object[k]&#x60; vs &#x60;previousAttributes[k]&#x60; to know what moved. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationUpdatedPayload.new(
  object: null,
  previous_attributes: {&quot;checkinDate&quot;:&quot;2026-06-11&quot;,&quot;checkoutDate&quot;:&quot;2026-06-16&quot;}
)
```

