# Repull::Reservation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull reservation ID | [optional] |
| **confirmation_code** | **String** | PMS confirmation code | [optional] |
| **property_id** | **Integer** | Property ID | [optional] |
| **platform** | **String** | Booking source | [optional] |
| **status** | **String** |  | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **guest_first_name** | **String** |  | [optional] |
| **guest_last_name** | **String** |  | [optional] |
| **guest_email** | **String** |  | [optional] |
| **guest_phone** | **String** |  | [optional] |
| **guest_count** | **Integer** |  | [optional] |
| **total_price** | **Float** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **provider** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Reservation.new(
  id: null,
  confirmation_code: HA-123456,
  property_id: null,
  platform: airbnb,
  status: confirmed,
  check_in: Wed Apr 15 00:00:00 UTC 2026,
  check_out: Mon Apr 20 00:00:00 UTC 2026,
  guest_first_name: John,
  guest_last_name: Smith,
  guest_email: null,
  guest_phone: null,
  guest_count: 4,
  total_price: 1250,
  currency: USD,
  provider: guesty
)
```

