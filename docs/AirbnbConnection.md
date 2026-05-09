# Repull::AirbnbConnection

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Connection row id | [optional] |
| **airbnb_id** | **String** | Airbnb-side listing id | [optional] |
| **host_id** | **String** | Airbnb host user id | [optional] |
| **active** | **Boolean** |  | [optional] |
| **sync_enabled** | **Boolean** |  | [optional] |
| **primary** | **Boolean** |  | [optional] |
| **markup** | **String** | Decimal markup (e.g. \&quot;1.10\&quot; for +10%). | [optional] |
| **created_at** | **Time** |  | [optional] |
| **amenities** | [**Array&lt;AirbnbConnectionAmenitiesInner&gt;**](AirbnbConnectionAmenitiesInner.md) | Present only when &#x60;?include&#x3D;amenities&#x60; is passed. Sourced from the local &#x60;listings_airbnb_amenities&#x60; cache (populated by the Airbnb sync worker). Returns &#x60;null&#x60; when the cache is empty for this connection — see the top-level &#x60;data_freshness&#x60; envelope to disambiguate \&quot;never synced\&quot; vs \&quot;host disconnected\&quot; vs \&quot;fresh and genuinely empty\&quot;. | [optional] |
| **accessibility_amenities** | [**Array&lt;AirbnbConnectionAccessibilityAmenitiesInner&gt;**](AirbnbConnectionAccessibilityAmenitiesInner.md) | Present only when &#x60;?include&#x3D;amenities&#x60; is passed. Accessibility-tagged subset of the local amenity cache (step-free access, wide doorways, grab rails, disabled parking, wheelchair, accessible-height fixtures, hoists, etc). Returns an empty array when amenities synced but none qualify as accessibility; returns &#x60;null&#x60; when the cache is empty for this connection (use &#x60;data_freshness&#x60; to disambiguate \&quot;never synced\&quot; from \&quot;fresh and genuinely empty\&quot;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbConnection.new(
  id: null,
  airbnb_id: 1116939745194659457,
  host_id: null,
  active: null,
  sync_enabled: null,
  primary: null,
  markup: null,
  created_at: null,
  amenities: null,
  accessibility_amenities: null
)
```

