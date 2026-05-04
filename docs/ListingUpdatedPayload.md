# Repull::ListingUpdatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **changes** | **Hash&lt;String, Object&gt;** | Map of &#x60;field&#x60; → &#x60;{ from, to }&#x60; pairs describing what changed. | [optional] |
| **updated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingUpdatedPayload.new(
  id: 6250,
  changes: {&quot;title&quot;:{&quot;from&quot;:&quot;R-Sable 1302&quot;,&quot;to&quot;:&quot;R-Sable 1302 — Radium Hot Springs&quot;}},
  updated_at: 2026-05-01T12:30Z
)
```

