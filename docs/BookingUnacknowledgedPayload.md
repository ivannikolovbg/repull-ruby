# Repull::BookingUnacknowledgedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ReservationWebhookObject**](ReservationWebhookObject.md) |  |  |
| **revision_id** | **String** | The outstanding revision. Acknowledge this to stop the alert. |  |
| **outstanding_since** | **Time** | When the booking actually changed — NOT when we noticed. Revisions are minted when you first poll the feed, so a mint timestamp would measure how recently you looked rather than how long the booking has waited. |  |
| **outstanding_hours** | **Integer** | Whole hours since &#x60;outstandingSince&#x60;, for convenience. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingUnacknowledgedPayload.new(
  object: null,
  revision_id: null,
  outstanding_since: null,
  outstanding_hours: null
)
```

