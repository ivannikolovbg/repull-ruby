# Repull::ListVrboThreads200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;ListVrboThreads200ResponseDataInner&gt;**](ListVrboThreads200ResponseDataInner.md) |  | [optional] |
| **pagination** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **data_freshness** | **Hash&lt;String, Object&gt;** | When this workspace&#39;s Vrbo data was last synced (&#x60;lastSyncedAt&#x60;, &#x60;stale&#x60;, &#x60;accounts[]&#x60;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListVrboThreads200Response.new(
  data: null,
  pagination: null,
  data_freshness: null
)
```

