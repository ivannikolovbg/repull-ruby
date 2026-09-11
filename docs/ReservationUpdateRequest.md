# Repull::ReservationUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **check_in_time** | **String** |  | [optional] |
| **check_out_time** | **String** |  | [optional] |
| **guest_count** | **Integer** |  | [optional] |
| **listing_id** | **Integer** | Move the reservation to another property in this workspace. Combined with dates, it is applied as ONE move so the access code is re-issued once. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationUpdateRequest.new(
  check_in: Fri Oct 02 00:00:00 UTC 2026,
  check_out: Wed Oct 07 00:00:00 UTC 2026,
  check_in_time: 16:00,
  check_out_time: 10:00,
  guest_count: 3,
  listing_id: 4119
)
```

