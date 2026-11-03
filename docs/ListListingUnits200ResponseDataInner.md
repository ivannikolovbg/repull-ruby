# Repull::ListListingUnits200ResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The PMS&#39;s id for the unit; &#x60;reservation.unit.id&#x60; and the per-night &#x60;units[].id&#x60; on &#x60;GET /v1/availability/{propertyId}&#x60; refer to it. | [optional] |
| **name** | **String** |  | [optional] |
| **active** | **Boolean** |  | [optional] |
| **parent_id** | **String** | A sub-space&#39;s parent room (a bed in a dorm), else null. | [optional] |
| **housekeeping_status** | **String** | The PMS&#39;s housekeeping state, verbatim (e.g. &#x60;Dirty&#x60;, &#x60;Clean&#x60;, &#x60;Inspected&#x60;). | [optional] |
| **floor** | **String** |  | [optional] |
| **source** | **String** | The PMS the unit comes from: &#x60;cloudbeds&#x60;, &#x60;mews&#x60;, &#x60;guesty&#x60;, … | [optional] |
| **listing_id** | **String** | The unit&#39;s own Repull listing id when the unit is a listing too (a Guesty multi-unit listing&#39;s units, each with its own calendar and stays), else null. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListListingUnits200ResponseDataInner.new(
  id: null,
  name: 101,
  active: null,
  parent_id: null,
  housekeeping_status: null,
  floor: null,
  source: mews,
  listing_id: null
)
```

