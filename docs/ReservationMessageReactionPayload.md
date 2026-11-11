# Repull::ReservationMessageReactionPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_id** | **Integer** |  | [optional] |
| **thread_id** | **String** |  | [optional] |
| **external_thread_id** | **String** |  | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **message_id** | **String** | The message reacted to. | [optional] |
| **external_message_id** | **String** |  | [optional] |
| **action** | **String** |  | [optional] |
| **reaction** | [**ReservationMessageReactionPayloadReaction**](ReservationMessageReactionPayloadReaction.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationMessageReactionPayload.new(
  reservation_id: 235970,
  thread_id: 900301,
  external_thread_id: 2648057088,
  listing_id: 23893,
  channel: airbnb,
  message_id: 1854462,
  external_message_id: 33532605539,
  action: null,
  reaction: null
)
```

