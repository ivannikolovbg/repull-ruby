# Repull::GetVrboListingContent200ResponseSectionsTaxes

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tax_source** | **String** |  | [optional] |
| **vrbo_collects** | **Boolean** |  | [optional] |
| **rules** | [**Array&lt;GetVrboListingContent200ResponseSectionsTaxesRulesInner&gt;**](GetVrboListingContent200ResponseSectionsTaxesRulesInner.md) |  | [optional] |
| **raw** | **Object** | Vrbo&#39;s tax settings as Vrbo returns them — the shape a write takes. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingContent200ResponseSectionsTaxes.new(
  tax_source: null,
  vrbo_collects: null,
  rules: null,
  raw: null
)
```

