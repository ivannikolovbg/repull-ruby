# Repull::WebhookEventCatalogEntry

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**WebhookEventType**](WebhookEventType.md) |  | [optional] |
| **domain** | **String** |  | [optional] |
| **title** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **sample_payload** | **Object** | Realistic example of the &#x60;data&#x60; payload an event of this &#x60;type&#x60; will deliver. Shape matches the matching variant in the &#x60;WebhookEvent&#x60; discriminated union. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::WebhookEventCatalogEntry.new(
  type: null,
  domain: null,
  title: null,
  description: null,
  sample_payload: null
)
```

