# Repull::BookingProperty

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **connection_id** | **String** | Repull-side id for this Booking.com connection. | [optional] |
| **hotel_id** | **String** | Booking.com hotel/property id. This is what &#x60;/v1/channels/booking/availability&#x60; takes as &#x60;property_id&#x60;. | [optional] |
| **active** | **Boolean** |  | [optional] |
| **sync_enabled** | **Boolean** |  | [optional] |
| **booking_url** | **String** |  | [optional] |
| **markup** | **String** | The Booking.com markup on this property, as a fraction: \&quot;0.18\&quot; &#x3D; +18%, shared by every listing on the property. Read or set it as a percentage with &#x60;/v1/listings/{id}/markups&#x60;. | [optional] |
| **sync_category** | **String** |  | [optional] |
| **suspended_at** | **Time** |  | [optional] |
| **suspension_reason** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **mapping_status** | **String** | &#x60;mapped&#x60; — at least one room points at a listing. &#x60;unmapped&#x60; — the property is claimed but its rooms are not mapped yet, so &#x60;listings&#x60; is empty; finish &#x60;POST /v1/connect/booking/map-rooms&#x60;. An unmapped property is listed rather than hidden, so a half-finished connection is visible instead of looking like no connection at all. | [optional] |
| **listings** | [**Array&lt;BookingPropertyListingsInner&gt;**](BookingPropertyListingsInner.md) | The Repull listings mapped under this property. Empty when &#x60;mappingStatus&#x60; is &#x60;unmapped&#x60;. Inactive listings are left out. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingProperty.new(
  connection_id: null,
  hotel_id: null,
  active: null,
  sync_enabled: null,
  booking_url: null,
  markup: null,
  sync_category: null,
  suspended_at: null,
  suspension_reason: null,
  created_at: null,
  mapping_status: null,
  listings: null
)
```

