# Repull::ReservationMessageReadPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_id** | **Integer** |  | [optional] |
| **thread_id** | **String** | The conversation id (&#x60;GET /v1/conversations/{id}&#x60;). | [optional] |
| **external_thread_id** | **String** |  | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **message_id** | **String** | The newest message the guest has read. Its &#x60;readAt&#x60; is now set. | [optional] |
| **external_message_id** | **String** |  | [optional] |
| **read_at** | **Time** | When the guest read it, as the channel reports it. | [optional] |
| **reader** | [**MessageActor**](MessageActor.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageReadPayload.new(
  reservation_id: 235970,
  thread_id: 900301,
  external_thread_id: 2648057088,
  listing_id: 23893,
  channel: airbnb,
  message_id: 1854462,
  external_message_id: 32877308873,
  read_at: null,
  reader: null
)
```

