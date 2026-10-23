# Repull::ReservationThreadAssignedPayloadObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_id** | **Integer** |  |  |
| **customer_id** | **Integer** |  |  |
| **listing_id** | **Integer** |  | [optional] |
| **thread_id** | **String** | Repull conversation id. |  |
| **external_thread_id** | **String** | The channel&#39;s own conversation id. | [optional] |
| **previous_reservation_id** | **Integer** | What the thread pointed at before. Null on the common orphan-adoption case; set when a thread moved between bookings. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationThreadAssignedPayloadObject.new(
  reservation_id: null,
  customer_id: null,
  listing_id: null,
  thread_id: null,
  external_thread_id: null,
  previous_reservation_id: null
)
```

