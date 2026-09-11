# Repull::Quote

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **website_id** | **String** |  | [optional] |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **guests** | **Integer** |  | [optional] |
| **nights** | **Integer** |  | [optional] |
| **available** | **Boolean** | False when the listing is unavailable for the range or outside its min/max stay. That is an answer, not an error. | [optional] |
| **reason** | **String** | Why it is unavailable. Present only when &#x60;available&#x60; is false. | [optional] |
| **currency** | **String** |  | [optional] |
| **available_units** | **Float** |  | [optional] |
| **pricing** | [**QuotePricing**](QuotePricing.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Quote.new(
  listing_id: null,
  website_id: null,
  check_in: null,
  check_out: null,
  guests: null,
  nights: null,
  available: null,
  reason: null,
  currency: null,
  available_units: null,
  pricing: null
)
```

