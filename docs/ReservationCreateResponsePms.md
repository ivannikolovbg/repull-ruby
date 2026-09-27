# Repull::ReservationCreateResponsePms

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** |  | [optional] |
| **reservation_id** | **String** | The PMS&#39;s own id for the booking. | [optional] |
| **applied** | **Array&lt;String&gt;** |  | [optional] |
| **errors** | [**Array&lt;CancelReservation200ResponsePmsErrorsInner&gt;**](CancelReservation200ResponsePmsErrorsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationCreateResponsePms.new(
  provider: mews,
  reservation_id: null,
  applied: null,
  errors: null
)
```

