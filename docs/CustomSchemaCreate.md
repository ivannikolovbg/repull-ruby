# Repull::CustomSchemaCreate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | 3-100 lowercase chars + hyphens. Must be unique within the workspace and cannot collide with reserved names (&#x60;calry&#x60;, &#x60;calry-v1&#x60;, &#x60;native&#x60;). |  |
| **description** | **String** | Optional human-readable note shown in the dashboard. | [optional] |
| **mappings** | **Hash&lt;String, String&gt;** | Field-mapping table. Keys are the output field names emitted in the response payload; values are simple expressions referenced against the source &#x60;native&#x60; payload (dot paths, basic arithmetic, string concatenation). Min 1 entry, max 50 entries. Each key must be &lt;&#x3D; 100 chars; each expression must be &lt;&#x3D; 500 chars and pass the safety check (no &#x60;eval&#x60;, no &#x60;function&#x60;, no &#x60;process&#x60;, etc.). |  |

## Example

```ruby
require 'repull'

instance = Repull::CustomSchemaCreate.new(
  name: my-app-schema,
  description: null,
  mappings: {&quot;listing_id&quot;:&quot;propertyId&quot;,&quot;arrival&quot;:&quot;checkIn&quot;,&quot;departure&quot;:&quot;checkOut&quot;,&quot;guest_name&quot;:&quot;primaryGuest.firstName + &#39; &#39; + primaryGuest.lastName&quot;,&quot;nightly_rate&quot;:&quot;financials.breakdown.basePrice / nights&quot;}
)
```

