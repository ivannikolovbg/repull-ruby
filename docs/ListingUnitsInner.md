# Repull::ListingUnitsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unit id — what &#x60;reservation.unit.id&#x60; and the per-night &#x60;units[].id&#x60; on availability refer to. | [optional] |
| **name** | **String** |  | [optional] |
| **active** | **Boolean** |  | [optional] |
| **parent_id** | **String** |  | [optional] |
| **housekeeping_status** | **String** |  | [optional] |
| **floor** | **String** |  | [optional] |
| **source** | **String** | The PMS the unit comes from: &#x60;cloudbeds&#x60;, &#x60;mews&#x60;, &#x60;guesty&#x60;, … | [optional] |
| **listing_id** | **String** | The unit&#39;s own Repull listing id when the unit is a listing too (a Guesty multi-unit listing&#39;s units, each with its own calendar), else &#x60;null&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingUnitsInner.new(
  id: null,
  name: null,
  active: null,
  parent_id: null,
  housekeeping_status: null,
  floor: null,
  source: null,
  listing_id: null
)
```

