# Repull::ListConnectionUnits200ResponseUnitsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unit_id** | **String** |  | [optional] |
| **unit_name** | **String** |  | [optional] |
| **grain** | **String** |  | [optional] |
| **current_listing_id** | **Integer** |  | [optional] |
| **suggested_listing_id** | **Integer** |  | [optional] |
| **meta** | **Object** | Channel details that identify the unit. Booking.com Extranet: &#x60;hotel&#x60; (property name), &#x60;hotelId&#x60; (Booking.com property ID), &#x60;roomId&#x60; (Booking.com room ID), &#x60;city&#x60;. Vrbo: &#x60;headline&#x60;, &#x60;address&#x60;, &#x60;vrboStatus&#x60;; the Vrbo listing ID is &#x60;unit_id&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListConnectionUnits200ResponseUnitsInner.new(
  unit_id: null,
  unit_name: null,
  grain: null,
  current_listing_id: null,
  suggested_listing_id: null,
  meta: null
)
```

