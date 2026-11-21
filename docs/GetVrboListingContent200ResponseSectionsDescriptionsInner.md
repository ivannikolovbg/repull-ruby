# Repull::GetVrboListingContent200ResponseSectionsDescriptionsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **locale** | **String** | &#x60;null&#x60; for the listing&#39;s own language; a language code for a hand-written translation. | [optional] |
| **primary** | **Boolean** | &#x60;true&#x60; for the listing&#39;s own language. | [optional] |
| **headline** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **limits** | [**GetVrboListingContent200ResponseSectionsDescriptionsInnerLimits**](GetVrboListingContent200ResponseSectionsDescriptionsInnerLimits.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingContent200ResponseSectionsDescriptionsInner.new(
  locale: fr-FR,
  primary: null,
  headline: null,
  description: null,
  limits: null
)
```

