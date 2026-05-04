# Repull::ReservationUpdatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **confirmation_code** | **String** |  | [optional] |
| **changes** | **Hash&lt;String, Object&gt;** | Map of &#x60;field&#x60; → &#x60;{ from, to }&#x60; pairs describing what changed. | [optional] |
| **updated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationUpdatedPayload.new(
  id: 215906,
  confirmation_code: HMA1234567,
  changes: {&quot;checkOut&quot;:{&quot;from&quot;:&quot;2026-06-05&quot;,&quot;to&quot;:&quot;2026-06-07&quot;},&quot;pricing&quot;:{&quot;from&quot;:{&quot;total&quot;:&quot;1320.00&quot;},&quot;to&quot;:{&quot;total&quot;:&quot;1640.00&quot;}}},
  updated_at: 2026-05-01T13:00Z
)
```

