# Repull::ReservationRequestCreatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ReservationWebhookObject**](ReservationWebhookObject.md) |  |  |
| **request_status** | **String** | Always &#x60;pending&#x60; on this event. |  |
| **respond_by** | **Time** | When the request lapses if nobody answers — Airbnb gives the host 24 hours from the request. &#x60;null&#x60; on channels without a request clock. | [optional] |
| **occurred_at** | **Time** | When the request was recorded. | [optional] |
| **revision** | **Time** | The reservation&#39;s &#x60;updatedAt&#x60; — order two deliveries about it without parsing the body. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationRequestCreatedPayload.new(
  object: null,
  request_status: null,
  respond_by: 2026-09-23T09:00Z,
  occurred_at: 2026-09-22T09:00:05Z,
  revision: null
)
```

