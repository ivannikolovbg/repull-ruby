# Repull::GetVrboListing200ResponseDataInnerContent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sections** | **Hash&lt;String, Object&gt;** | With &#x60;include&#x3D;content&#x60;: each section Repull holds, as &#x60;GET /v1/channels/vrbo/listings/{id}/{section}&#x60; returns its &#x60;data&#x60;. | [optional] |
| **synced_at** | **Hash&lt;String, String&gt;** | When each section was read from Vrbo. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListing200ResponseDataInnerContent.new(
  sections: null,
  synced_at: null
)
```

