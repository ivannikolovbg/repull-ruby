# Repull::TiketReservation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reservation_id** | **String** | The Repull reservation this room became (&#x60;GET /v1/reservations/{id}&#x60;). &#x60;null&#x60; while the room type is not mapped to a listing; mapping it records the booking. | [optional] |
| **confirmation_code** | **String** | &#x60;&lt;tiketReservationId&gt;&#x60; for the first room, &#x60;&lt;tiketReservationId&gt;-2&#x60;, &#x60;-3&#x60;, … for the others. | [optional] |
| **tiket_reservation_id** | **String** | tiket.com&#39;s id of the whole booking. | [optional] |
| **previous_tiket_reservation_id** | **String** | Set when this booking replaced an earlier one. tiket.com sends a date change as a cancellation plus a new booking; Repull applies it as a change to the original reservation. | [optional] |
| **room_index** | **Integer** | 1 for the first room of the booking. | [optional] |
| **property_id** | **String** | tiket.com Hotel ID. | [optional] |
| **room_type_code** | **String** |  | [optional] |
| **rate_plan_code** | **String** |  | [optional] |
| **rate_plan_name** | **String** |  | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **adults** | **Integer** |  | [optional] |
| **children** | **Integer** |  | [optional] |
| **infants** | **Integer** |  | [optional] |
| **guest_name** | **String** |  | [optional] |
| **guest_country** | **String** |  | [optional] |
| **total_amount** | **Float** | What the guest paid for this room. | [optional] |
| **net_amount** | **Float** | What tiket.com pays the property for this room. | [optional] |
| **currency** | **String** |  | [optional] |
| **payment_type** | **String** | Payment type as tiket.com sent it. | [optional] |
| **payment_method** | **String** | How tiket.com pays the property: &#x60;Virtual Credit Card&#x60; or &#x60;Bank Transfer&#x60;. Card details are never returned by the API. | [optional] |
| **meal_plan_code** | **String** |  | [optional] |
| **non_refundable** | **Boolean** |  | [optional] |
| **cancellation_policy** | **String** | Cancellation policy text as tiket.com sent it. | [optional] |
| **special_requests** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketReservation.new(
  reservation_id: null,
  confirmation_code: null,
  tiket_reservation_id: null,
  previous_tiket_reservation_id: null,
  room_index: null,
  property_id: null,
  room_type_code: null,
  rate_plan_code: null,
  rate_plan_name: null,
  check_in: null,
  check_out: null,
  adults: null,
  children: null,
  infants: null,
  guest_name: null,
  guest_country: null,
  total_amount: null,
  net_amount: null,
  currency: IDR,
  payment_type: null,
  payment_method: Bank Transfer,
  meal_plan_code: null,
  non_refundable: null,
  cancellation_policy: null,
  special_requests: null,
  status: null,
  created_at: null,
  updated_at: null
)
```

