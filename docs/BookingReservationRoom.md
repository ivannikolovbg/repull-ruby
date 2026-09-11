# Repull::BookingReservationRoom

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Room id. | [optional] |
| **roomreservation_id** | **String** | Per-room reservation id. | [optional] |
| **arrival_date** | **String** | Room arrival date (YYYY-MM-DD). | [optional] |
| **departure_date** | **String** | Room departure date (YYYY-MM-DD). | [optional] |
| **guest_name** | **String** |  | [optional] |
| **numberofguests** | **Integer** |  | [optional] |
| **adults** | **Integer** |  | [optional] |
| **children** | **Integer** |  | [optional] |
| **meal_plan** | **String** |  | [optional] |
| **totalprice** | **Float** |  | [optional] |
| **currencycode** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **special_requests** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingReservationRoom.new(
  id: null,
  roomreservation_id: null,
  arrival_date: null,
  departure_date: null,
  guest_name: null,
  numberofguests: null,
  adults: null,
  children: null,
  meal_plan: null,
  totalprice: null,
  currencycode: null,
  status: null,
  special_requests: null
)
```

