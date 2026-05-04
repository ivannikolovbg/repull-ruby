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
| **amenities** | [**Array&lt;AirbnbConnectionAmenitiesInner&gt;**](AirbnbConnectionAmenitiesInner.md) | Present only when &#x60;?include&#x3D;amenities&#x60; is passed. Sourced from &#x60;GET /v2/listings/:id/amenities&#x60; on Airbnb. | [optional] |
| **accessibility_amenities** | **Array&lt;Object&gt;** | Present only when &#x60;?include&#x3D;amenities&#x60; is passed. | [optional] |
| **_errors** | [**Hash&lt;String, AirbnbConnectionErrorsValue&gt;**](AirbnbConnectionErrorsValue.md) | Per-expansion failures. Present only when an &#x60;?include&#x3D;&#x60; upstream call failed for this connection (others may still succeed). | [optional] |

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
  accessibility_amenities: null,
  _errors: null
)
```

