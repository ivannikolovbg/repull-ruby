# Repull::CreatePriceLabsKeyRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_ids** | **Array&lt;String&gt;** | Only these listings of the workspace (&#x60;GET /v1/properties&#x60;). Omit for every listing, new ones included. | [optional] |
| **label** | **String** | A name for the connection. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreatePriceLabsKeyRequest.new(
  listing_ids: [&quot;4118&quot;,&quot;4119&quot;],
  label: PriceLabs — beach houses
)
```

