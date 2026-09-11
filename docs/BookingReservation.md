# Repull::BookingReservation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Booking.com reservation id. | [optional] |
| **status** | **String** |  | [optional] |
| **date** | **String** | Booking date (YYYY-MM-DD). | [optional] |
| **time** | **String** | Booking time. | [optional] |
| **customer** | **Hash&lt;String, Object&gt;** | Guest / customer block (name, contact, address) in Booking&#39;s OTA shape. | [optional] |
| **room** | [**Array&lt;BookingReservationRoom&gt;**](BookingReservationRoom.md) | Reserved rooms. | [optional] |
| **total_price** | **Float** |  | [optional] |
| **currency_code** | **String** |  | [optional] |
| **payment_status** | **String** |  | [optional] |
| **commission_amount** | **Float** |  | [optional] |
| **cancellation_deadline** | **String** |  | [optional] |
| **special_requests** | **Array&lt;String&gt;** |  | [optional] |
| **company_name** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingReservation.new(
  id: null,
  status: null,
  date: null,
  time: null,
  customer: null,
  room: null,
  total_price: null,
  currency_code: null,
  payment_status: null,
  commission_amount: null,
  cancellation_deadline: null,
  special_requests: null,
  company_name: null
)
```

