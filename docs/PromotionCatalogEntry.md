# Repull::PromotionCatalogEntry

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel** | **String** |  | [optional] |
| **type** | [**PromotionType**](PromotionType.md) |  | [optional] |
| **channel_type** | **String** |  | [optional] |
| **campaign** | **String** |  | [optional] |
| **label** | **String** |  | [optional] |
| **description** | **String** | One or two sentences to show hosts. | [optional] |
| **is_new** | **Boolean** | Newly available — show a “New” badge. | [optional] |
| **available** | **Boolean** |  | [optional] |
| **unavailable_reason** | **String** |  | [optional] |
| **single** | **Boolean** | Only one at a time (Airbnb types; Booking.com mobile and country rates per property). | [optional] |
| **fields** | [**Hash&lt;String, PromotionCatalogField&gt;**](PromotionCatalogField.md) | Every field, supported or not, so a UI can grey out what a type does not take. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionCatalogEntry.new(
  channel: null,
  type: null,
  channel_type: null,
  campaign: null,
  label: null,
  description: null,
  is_new: null,
  available: null,
  unavailable_reason: null,
  single: null,
  fields: null
)
```

