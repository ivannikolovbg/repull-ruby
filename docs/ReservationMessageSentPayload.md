# Repull::ReservationMessageSentPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_id** | **Integer** |  | [optional] |
| **thread_id** | **String** |  | [optional] |
| **message_id** | **String** | Repull message id, as &#x60;GET /v1/conversations/{id}/messages&#x60; returns it. | [optional] |
| **external_message_id** | **String** | The channel&#39;s own message id. Dedupe on it. | [optional] |
| **channel** | **String** |  | [optional] |
| **source** | **String** | &#x60;channel&#x60;: sent in the channel&#39;s own app (e.g. the Airbnb app). &#x60;repull&#x60;: sent through Repull — the API, the dashboard, an automation or AI. | [optional] |
| **from** | [**ReservationMessageSentPayloadFrom**](ReservationMessageSentPayloadFrom.md) |  | [optional] |
| **body** | **String** |  | [optional] |
| **sent_at** | **Time** |  | [optional] |
| **direction** | **String** |  | [optional] |
| **is_automated** | **Boolean** |  | [optional] |
| **ai_generated** | **Boolean** |  | [optional] |
| **attachments** | [**Array&lt;ConversationMessageAttachment&gt;**](ConversationMessageAttachment.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageSentPayload.new(
  reservation_id: 235970,
  thread_id: 900301,
  message_id: 1854462,
  external_message_id: 32877308873,
  channel: airbnb,
  source: null,
  from: null,
  body: null,
  sent_at: null,
  direction: null,
  is_automated: null,
  ai_generated: null,
  attachments: null
)
```

