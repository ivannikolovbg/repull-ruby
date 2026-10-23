# Repull::ImportFromChannexRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **api_key** | **String** | Your Channex API key (the &#x60;user-api-key&#x60; header value). Used for this request only. |  |
| **environment** | **String** | &#x60;production&#x60; reads app.channex.io, &#x60;staging&#x60; reads staging.channex.io. | [optional][default to &#39;production&#39;] |
| **dry_run** | **Boolean** | Match and report without writing anything. | [optional][default to false] |

## Example

```ruby
require 'repull'

instance = Repull::ImportFromChannexRequest.new(
  api_key: null,
  environment: null,
  dry_run: null
)
```

