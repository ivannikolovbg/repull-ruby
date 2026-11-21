# Repull::UpdateVrboListingDescriptionsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **locale** | **String** | Leave out for the listing&#39;s own language. A language code (one of &#x60;languages&#x60; in the read) writes that language&#39;s hand-written translation, which replaces Vrbo&#39;s automatic one. | [optional] |
| **headline** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateVrboListingDescriptionsRequest.new(
  locale: fr-FR,
  headline: null,
  description: null
)
```

