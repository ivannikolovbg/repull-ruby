# Repull::ReservationUpdateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **check_in_time** | **String** |  | [optional] |
| **check_out_time** | **String** |  | [optional] |
| **status** | **String** | A move forces the reservation to a confirmed status — read it back rather than assuming it is unchanged. | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **changed** | **Array&lt;String&gt;** | The fields this request actually changed. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationUpdateResponse.new(
  id: null,
  confirmation_code: null,
  listing_id: null,
  check_in: null,
  check_out: null,
  check_in_time: null,
  check_out_time: null,
  status: null,
  updated_at: null,
  changed: [&quot;checkOut&quot;]
)
```

