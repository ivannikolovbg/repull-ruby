# Repull::CustomSchemaUpdate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** |  | [optional] |
| **mappings** | **Hash&lt;String, String&gt;** | Field-mapping table. Keys are the output field names emitted in the response payload; values are simple expressions referenced against the source &#x60;native&#x60; payload (dot paths, basic arithmetic, string concatenation). Min 1 entry, max 50 entries. Each key must be &lt;&#x3D; 100 chars; each expression must be &lt;&#x3D; 500 chars and pass the safety check (no &#x60;eval&#x60;, no &#x60;function&#x60;, no &#x60;process&#x60;, etc.). | [optional] |
| **active** | **Boolean** | Toggle the schema on/off. When &#x60;false&#x60;, requests carrying this schema name in &#x60;X-Schema&#x60; fall back to &#x60;native&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CustomSchemaUpdate.new(
  description: null,
  mappings: {&quot;listing_id&quot;:&quot;propertyId&quot;,&quot;arrival&quot;:&quot;checkIn&quot;,&quot;departure&quot;:&quot;checkOut&quot;,&quot;guest_name&quot;:&quot;primaryGuest.firstName + &#39; &#39; + primaryGuest.lastName&quot;,&quot;nightly_rate&quot;:&quot;financials.breakdown.basePrice / nights&quot;},
  active: null
)
```

