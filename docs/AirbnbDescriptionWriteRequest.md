# Repull::AirbnbDescriptionWriteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **locale** | **String** | Language tag — &#x60;en&#x60;, &#x60;it&#x60;, &#x60;pt-BR&#x60;. &#x60;GET /v1/channels/airbnb/listings/{id}/settings?type&#x3D;locales&#x60; lists the locales already synced for this listing. |  |
| **description** | [**AirbnbDescriptionWriteRequestDescription**](AirbnbDescriptionWriteRequestDescription.md) |  |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbDescriptionWriteRequest.new(
  locale: it,
  description: null
)
```

