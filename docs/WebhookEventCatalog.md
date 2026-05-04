# Repull::WebhookEventCatalog

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **domains** | [**Array&lt;WebhookEventCatalogDomainsInner&gt;**](WebhookEventCatalogDomainsInner.md) |  | [optional] |
| **flat** | [**Array&lt;WebhookEventCatalogEntry&gt;**](WebhookEventCatalogEntry.md) | All events in a flat list (same entries as &#x60;domains[].events&#x60;, ungrouped). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::WebhookEventCatalog.new(
  domains: null,
  flat: null
)
```

