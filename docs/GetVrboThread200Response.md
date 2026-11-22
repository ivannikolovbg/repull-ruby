# Repull::GetVrboThread200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**ListVrboThreads200ResponseDataInner**](ListVrboThreads200ResponseDataInner.md) |  | [optional] |
| **data_freshness** | **Hash&lt;String, Object&gt;** | When this workspace&#39;s Vrbo data was last synced (&#x60;lastSyncedAt&#x60;, &#x60;stale&#x60;, &#x60;accounts[]&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboThread200Response.new(
  data: null,
  data_freshness: null
)
```

