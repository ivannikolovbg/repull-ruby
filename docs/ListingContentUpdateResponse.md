# Repull::ListingContentUpdateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The listing id (serialized as a string to preserve precision). | [optional] |
| **changed** | **Array&lt;String&gt;** | Content slabs that were actually written, e.g. [\&quot;title\&quot;,\&quot;occupancy\&quot;,\&quot;amenities\&quot;]. A non-English write also reports &#x60;locale:&lt;tag&gt;&#x60; so you can see which row was written. A rate change reports &#x60;pricing&#x60;, and &#x60;calendar&#x60; as well when nights on the calendar moved to the new rate. | [optional] |
| **deferred** | **Array&lt;String&gt;** | Provided-but-not-applied fields — e.g. \&quot;photos\&quot; when a non-empty photos array carried no valid http(s) URL. On a listing a PMS manages, also the content sections the PMS refused (&#x60;title&#x60;, &#x60;descriptions&#x60;, &#x60;times&#x60;, &#x60;capacity&#x60;, &#x60;amenities&#x60;, &#x60;houseRules&#x60;, &#x60;address&#x60;, &#x60;photos&#x60;), which are then not written here either. | [optional] |
| **pms** | [**ListingContentUpdateResponsePms**](ListingContentUpdateResponsePms.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateResponse.new(
  id: null,
  changed: null,
  deferred: null,
  pms: null
)
```

