# Repull::BookingRestrictionVerificationRow

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **room_id** | **String** |  | [optional] |
| **rate_id** | **String** |  | [optional] |
| **date** | **Date** |  | [optional] |
| **field** | **String** |  | [optional] |
| **expected** | [**BookingRestrictionVerificationRowExpected**](BookingRestrictionVerificationRowExpected.md) |  | [optional] |
| **booking_value** | [**BookingRestrictionVerificationRowBookingValue**](BookingRestrictionVerificationRowBookingValue.md) |  | [optional] |
| **match** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingRestrictionVerificationRow.new(
  room_id: null,
  rate_id: null,
  date: null,
  field: null,
  expected: null,
  booking_value: null,
  match: null
)
```

