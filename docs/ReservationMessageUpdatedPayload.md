# Repull::ReservationMessageUpdatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_id** | **Integer** |  | [optional] |
| **thread_id** | **String** |  | [optional] |
| **message_id** | **String** |  | [optional] |
| **external_message_id** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **from** | [**ReservationMessageUpdatedPayloadFrom**](ReservationMessageUpdatedPayloadFrom.md) |  | [optional] |
| **body** | **String** | The text after the edit. | [optional] |
| **previous_body** | **String** | The text before the edit. | [optional] |
| **edited_at** | **Time** | When the edit was made, as the channel reports it. Also the event&#39;s &#x60;revision&#x60;. | [optional] |
| **sent_at** | **Time** | When the message was first sent. | [optional] |
| **direction** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageUpdatedPayload.new(
  reservation_id: 235970,
  thread_id: 900301,
  message_id: 1854462,
  external_message_id: 32877308873,
  channel: airbnb,
  from: null,
  body: null,
  previous_body: null,
  edited_at: null,
  sent_at: null,
  direction: null
)
```

