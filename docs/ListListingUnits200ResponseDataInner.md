# Repull::ListListingUnits200ResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The PMS&#39;s id for the room; &#x60;reservation.unit.id&#x60; refers to it. | [optional] |
| **name** | **String** |  | [optional] |
| **active** | **Boolean** |  | [optional] |
| **parent_id** | **String** | A sub-space&#39;s parent room (a bed in a dorm), else null. | [optional] |
| **housekeeping_status** | **String** | The PMS&#39;s housekeeping state, verbatim (e.g. &#x60;Dirty&#x60;, &#x60;Clean&#x60;, &#x60;Inspected&#x60;). | [optional] |
| **floor** | **String** |  | [optional] |
| **source** | **String** |  | [optional] |

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
  source: mews
)
```

