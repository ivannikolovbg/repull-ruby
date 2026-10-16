# Repull::PromotionCatalogField

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **supported** | **Boolean** |  | [optional] |
| **coming_soon** | **Boolean** | Shown but not yet usable on this channel. | [optional] |
| **required** | **Boolean** |  | [optional] |
| **min** | **Float** |  | [optional] |
| **max** | **Float** |  | [optional] |
| **fixed** | **Float** | Value the channel sets (e.g. Airbnb’s 15% top-rated-guests discount). | [optional] |
| **options** | [**Array&lt;PromotionCatalogFieldOptionsInner&gt;**](PromotionCatalogFieldOptionsInner.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionCatalogField.new(
  supported: null,
  coming_soon: null,
  required: null,
  min: null,
  max: null,
  fixed: null,
  options: null
)
```

