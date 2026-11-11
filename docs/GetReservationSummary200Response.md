# Repull::GetReservationSummary200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | **Date** |  |  |
| **to** | **Date** |  |  |
| **basis** | **String** |  |  |
| **group_by** | **Array&lt;String&gt;** |  |  |
| **as_of** | **Date** |  |  |
| **listing_count** | **Integer** | Active listings covered (the occupancy denominator). |  |
| **totals** | [**Array&lt;GetReservationSummary200ResponseTotalsInner&gt;**](GetReservationSummary200ResponseTotalsInner.md) |  |  |
| **groups** | [**Array&lt;GetReservationSummary200ResponseTotalsInner&gt;**](GetReservationSummary200ResponseTotalsInner.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::GetReservationSummary200Response.new(
  from: Tue Nov 10 00:00:00 UTC 2026,
  to: Tue Feb 09 00:00:00 UTC 2027,
  basis: null,
  group_by: null,
  as_of: null,
  listing_count: 19,
  totals: null,
  groups: null
)
```

