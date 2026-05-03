# Repull::BookingVerifyHotelResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **valid** | **Boolean** |  |  |
| **session_id** | **String** |  |  |
| **connection_id** | **String** | Repull-side &#x60;pms_connections.id&#x60; for the linked Booking account. |  |
| **hotel_id** | **String** |  |  |
| **hotel_name** | **String** |  | [optional] |
| **hotel_type** | **String** | Booking.com hotel/property type code (e.g. &#x60;apartment&#x60;, &#x60;hotel&#x60;). | [optional] |
| **country** | **String** |  | [optional] |
| **city** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingVerifyHotelResponse.new(
  valid: true,
  session_id: null,
  connection_id: null,
  hotel_id: null,
  hotel_name: null,
  hotel_type: null,
  country: null,
  city: null
)
```

